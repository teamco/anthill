class CreateItemConnections < ActiveRecord::Migration
  def change
    create_table :item_connections do |t|
      t.integer :item_id,                       :null => false
      t.boolean :up_connect,  :default => true, :null => false
      t.boolean :up_list,     :default => true, :null => false
      t.boolean :up_create,   :default => true, :null => false
      t.boolean :up_read,     :default => true, :null => false
      t.boolean :up_update,   :default => true, :null => false
      t.boolean :up_delete,   :default => true, :null => false

      t.references :connectable,  :polymorphic => true
      t.timestamps
    end

    add_index :item_connections,  :item_id
  end
end
