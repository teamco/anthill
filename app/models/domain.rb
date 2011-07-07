class Domain < ActiveRecord::Base
  belongs_to  :item
  has_many    :item_connections,
              :as => :connectable

end
