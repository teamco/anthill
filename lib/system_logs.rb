module SystemLogs

    protected

#  Before filter:
#  Create user log per each action
    def create_log
        logger.info "-- Create user log: #{Time.now}"

        qs = request.query_string.dup.force_encoding("UTF-8")

        hash = {
            :user_id         => nil, #User.find_user(session[:system][:user]),
            :remote_ip       => request.remote_ip.to_s,
            :session_id      => request.session_options[:id],
            :status          => response.status,
            :method          => request.method.to_s,
            :controller      => controller_name,
            :action          => action_name,
            :language        => params[:lang],
            :item_id         => params[:id],
            :domain          => request.domain,
            :request_uri     => request.fullpath,
            :url             => request.url,
            :protocol        => request.protocol,
            :host            => request.host,
            :port            => request.port,
            :user_params     => request.params.as_json.to_json,
            :user_session    => request.session.as_json.to_json,
            :query_string    => qs,
            :http_accept     => request.headers['HTTP_ACCEPT'],
            :format          => request.format.as_json.to_json,
            :ssl             => request.ssl?,
            :xhr             => request.xhr?,
            :referer         => request.env['HTTP_REFERER'],
            :http_user_agent => request.headers["HTTP_USER_AGENT"],
            :server_software => request.headers["SERVER_SOFTWARE"],
            :content_type    => response.content_type,
            :location        => response.location,
            :charset         => response.charset
        }

        @log = UserLog.create!(hash) #if SystemLogs.except({:controller => controller_name, :action => action_name})

    end

    def update_log
        completed_time = Time.now
        logger.info "-- Update user log: #{completed_time}"
        @log.update_attributes(
            {
                :updated_at   => completed_time,
                :completed_in => (completed_time.to_f - @log.created_at.to_f).round(4),
                :is_error     => false
            }
        )
    end

    private

    HTTP_ERRORS = [404, 500]

    HTTP_ERRORS.each do |status|
        define_method "status_#{status}" do |exception|
            error_map(exception, status)
        end
    end

    def error_map(exception, status)
        begin
            log = {
                :error_type   => exception.class.name,
                :error_status => status,
                :error_title  => exception.message,
                :error_trace  => exception.backtrace
            }
            @log.nil? ? ErrorLog.create!(log) : @log.create_error_log!(log)
        rescue Exception => e
            ap(
                :log     => @log.as_json,
                :error   => exception.inspect,
                :on_save => e.inspect
            )
        end
    end
end

