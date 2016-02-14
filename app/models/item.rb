class Item < ActiveRecord::Base
  acts_as_paranoid
  
  validates :text, presence: true, length: { maximum: 140, message: "Texto muito longo" }
  
  belongs_to :list
  belongs_to :item_type
end
