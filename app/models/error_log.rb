class ErrorLog < ActiveRecord::Base
  belongs_to  :user_log
  belongs_to  :user,
              :class_name  => 'User',
              :foreign_key => 'fixed_by'
end
