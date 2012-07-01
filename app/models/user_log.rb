class UserLog < ActiveRecord::Base
    belongs_to :user
    has_one :error_log
end