class Language < ActiveRecord::Base
  belongs_to  :item
  belongs_to  :user
  
  has_many    :item_connections,
              :as => :connectable
end
