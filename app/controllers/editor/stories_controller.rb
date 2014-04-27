module Editor
  class StoriesController < ActionController::Base
    
    def show
      render "show", :layout => "application"
    end
    
    def add_page
      respond_to do |format|
        format.js
        format.html {}
      end 
    end
    
  end
end