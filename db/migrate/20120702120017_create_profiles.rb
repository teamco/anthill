class CreateProfiles < ActiveRecord::Migration
    def change
        create_table :profiles do |t|
            t.integer :user_id
            t.string :email
            t.string :first_name
            t.string :last_name
            t.string :nick_name
        end
    end
end
