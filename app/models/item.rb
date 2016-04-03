class Item < ActiveRecord::Base
  acts_as_paranoid
  
  default_scope { order([:order]) }
  default_scope { where(is_active: true) }
  
  validates :text, presence: true, length: { maximum: 140, message: "Texto muito longo" }
  validates :order, presence: true
  
  belongs_to :list
  belongs_to :item_type
end
