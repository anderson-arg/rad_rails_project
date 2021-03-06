class User < ActiveRecord::Base
    acts_as_paranoid
    
    extend FriendlyId
    friendly_id :email
    
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    validates :name, :email, :password, presence: true
    validates :email, format: { with:  EMAIL_REGEX }, uniqueness: true
    validates :password, :length => { :minimum => 6}, :confirmation =>true
    
    has_secure_password
    
    has_many :lists
end
