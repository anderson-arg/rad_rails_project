class Item < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :list
  belongs_to :item_type
end
