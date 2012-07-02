class CreateShares < ActiveRecord::Migration
    def change
        create_table :shares do |t|
            t.string :title
            t.text :description
            t.text :meta_description
            t.text :meta_keywords

            t.references :shareable, :polymorphic => true
        end
    end
end
