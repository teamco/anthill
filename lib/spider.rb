module Spider

    ROBOTS = [
        'Spider',
        'Meta',
        'Google',
        'Stack',
        'Rambler',
        'StackRambler',
        'Spider',
        'Aport',
        'Yahoo',
        'MSN',
        'Yandex',
        'bot',
        'MSIE incompatible'
    ]

    protected
    def search_bots

        user_agent = request.env['HTTP_USER_AGENT']
        ROBOTS.detect { |bot| bot if user_agent.match(bot) }
    end

    def check_black_list
        if request.env["HTTP_USER_AGENT"] =~ /WebCopier|Curl|Wget/
            rescue_from ActionController::RoutingError, :with => :status_404
            return
        end
    end

    def clear_flash
        flash.discard if request.xhr?
    end

end