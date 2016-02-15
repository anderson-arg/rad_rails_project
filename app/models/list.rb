class List < ActiveRecord::Base
  acts_as_paranoid
  
  scope :most_recent, -> { order("created_at DESC") }
  
  validates :title, presence: true, length: { maximum: 140, message: "Texto muito longo. Máximo permitido: 140 caracteres." }, uniqueness: {message: "Já existe uma lista como mesmo título."}
  
  belongs_to :user
  belongs_to :list_category
  
  has_many :items
end
