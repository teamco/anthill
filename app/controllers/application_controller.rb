class ApplicationController < ActionController::Base

    protect_from_forgery

    include SystemLogs
    include Spider

    before_filter :create_log,
                  :check_black_list,
                  :set_no_cache

    after_filter :update_log,
                 :clear_flash

    unless Rails.application.config.consider_all_requests_local
        rescue_from Exception, :with => :status_500
        rescue_from ActiveRecord::RecordNotFound, :with => :status_500
        rescue_from NoMethodError, :with => :status_500
        rescue_from ActionController::RoutingError, :with => :status_404
        rescue_from ActionController::UnknownController, :with => :status_404
    end

    def set_no_cache
        if Rails.application.config.consider_all_requests_local
            response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
            response.headers["Pragma"]        = "no-cache"
            response.headers["Expires"]       = "#{1.year.ago}"
        end
    end

end