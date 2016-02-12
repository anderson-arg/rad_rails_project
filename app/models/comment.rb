class Comment < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :user_list
  belongs_to :user
end
