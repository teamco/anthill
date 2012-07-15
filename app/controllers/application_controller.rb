class ApplicationController < ActionController::Base
    protect_from_forgery

    include SystemLogs
    include Spider

    before_filter :create_log, :check_black_list
    after_filter :update_log, :clear_flash

    unless Rails.application.config.consider_all_requests_local
        rescue_from Exception, :with => :status_500
        rescue_from ActiveRecord::RecordNotFound, :with => :status_500
        rescue_from NoMethodError, :with => :status_500
        rescue_from ActionController::RoutingError, :with => :status_404
        rescue_from ActionController::UnknownController, :with => :status_404
    end

end