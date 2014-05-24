module Editor
  class StoriesController < EditorController
    
    def show
    end
    
    def add_page
      respond_to do |format|
        format.js 
        format.html
      end 
    end
    
  end
end