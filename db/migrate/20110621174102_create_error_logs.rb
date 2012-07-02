class CreateErrorLogs < ActiveRecord::Migration
    def change
        create_table :error_logs do |t|
            t.integer :user_log_id
            t.string :error_type
            t.integer :error_status
            t.string :error_title
            t.text :error_trace, :limit => 1048576
            t.boolean :is_fixed, :default => false
            t.integer :fixed_by # user_id
            t.timestamps
        end
    end
end
