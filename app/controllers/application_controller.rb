class ApplicationController < ActionController::Base
  protect_from_forgery

  unless Rails.application.config.consider_all_requests_local
    include SystemLogs

    before_filter :create_log
    after_filter  :update_log
    
    rescue_from Exception,                            :with => :status_500
    rescue_from ActiveRecord::RecordNotFound,         :with => :status_500
    rescue_from NoMethodError,                        :with => :status_500
    rescue_from ActionController::RoutingError,       :with => :status_404
    rescue_from ActionController::UnknownController,  :with => :status_404
  end

end