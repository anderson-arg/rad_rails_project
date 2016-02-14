class User < ActiveRecord::Base
    acts_as_paranoid
    
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    validates :email, format: { with:  EMAIL_REGEX }, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    has_many :lists
end
