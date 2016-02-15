class HomeController < ApplicationController
    
    def index
        @recent_lists = List.most_recent.take(4)
    end
    
end
