class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer     :user_id
      t.string      :remote_ip
      t.string      :session_id
      t.integer     :status
      t.integer     :location
      t.string      :method
      t.string      :controller
      t.string      :action
      t.string      :language,      :limit => 2
      t.integer     :item_id
      t.string      :domain
      t.string      :request_uri
      t.string      :url
      t.string      :protocol
      t.string      :host
      t.string      :port
      t.text        :user_params,   :limit => 1048576
      t.text        :user_session
      t.text        :user_cookies
      t.string      :query_string
      t.string      :http_accept
      t.string      :format
      t.boolean     :ssl
      t.boolean     :xhr
      t.string      :referer
      t.string      :http_user_agent
      t.string      :server_software
      t.string      :content_type
      t.string      :charset
      t.float       :completed_in
      t.boolean     :is_error,      :default => true
      t.timestamps
    end
  end
end
