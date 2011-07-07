class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer   :item_id,       :null => false
      t.integer   :language_id
      t.string    :login
      t.string    :password_hash, :null => false
      t.string    :password_salt, :null => false
      t.integer   :timeout,       :default => nil
    end

#    add_index :users, :item_id
  end
end
