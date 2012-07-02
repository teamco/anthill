class CreateDomains < ActiveRecord::Migration
    def change
        create_table :domains do |t|
            t.integer :item_id
            t.string :name
            t.string :ip
        end

        add_index :domains, :item_id
    end
end
