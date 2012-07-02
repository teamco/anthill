class CreatePreferences < ActiveRecord::Migration
    def change
        create_table :preferences do |t|
            t.integer :item_id, :null => false
            t.boolean :visible, :default => true
            t.boolean :active, :default => true
            t.boolean :published, :default => true
            t.boolean :public, :default => true
            t.boolean :commented, :default => false
            t.timestamps
        end

        add_index :preferences, :item_id
    end
end
