class Item < ActiveRecord::Base

  has_one   :tool,        :dependent => :destroy
  has_one   :preference,  :dependent => :destroy
  has_one   :user,        :dependent => :destroy
  has_one   :language,    :dependent => :destroy
  has_one   :domain,      :dependent => :destroy

  has_many  :shares, :as  => :shareable,
            :dependent    => :destroy

  has_many  :references,
            :class_name   => 'Item',
            :foreign_key  => 'reference_id'

  acts_as_nested_set  :dependent => :destroy,
                      :scope => [
                        :reference_id,
                        :parent_id
                      ]
end
