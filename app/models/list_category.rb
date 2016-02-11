class ListCategory < ActiveRecord::Base
    acts_as_paranoid
    
    has_many :lists
end
