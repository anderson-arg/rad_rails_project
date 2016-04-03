class List < ActiveRecord::Base
  acts_as_paranoid
  
  scope :most_recent, -> { order("updated_at DESC") }
  
  validates :title, presence: true, length: { maximum: 140, message: "Texto muito longo. Máximo permitido: 140 caracteres." }, uniqueness: {:scope => [:user_id, :list_category_id]}
  
  belongs_to :user
  belongs_to :list_category
  
  has_many :items
end
