class CreateTools < ActiveRecord::Migration
    def change
        create_table :tools do |t|
            t.integer :item_id, :null => false
            t.string :tool_type
        end

        add_index :tools, :item_id
    end
end
