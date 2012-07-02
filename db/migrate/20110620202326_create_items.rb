class CreateItems < ActiveRecord::Migration
    def change
        create_table :items do |t|
            t.integer :reference_id
            t.integer :parent_id
            t.integer :lft
            t.integer :rgt

            t.integer :depth

            t.integer :language_id
            t.integer :tool_id
            t.integer :lock_id
            t.integer :website_id
            t.integer :created_by
            t.integer :updated_by
        end

        add_index :items, :reference_id
        add_index :items, :parent_id

    end
end
