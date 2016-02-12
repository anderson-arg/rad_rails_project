class List < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :user
  belongs_to :list_category
end
