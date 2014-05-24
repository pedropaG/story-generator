module Editor
  class PagesController < EditorController
    
    def show
      @page = Page.find(params[:id])
    end
    
    def new
      @page = Page.new 
      #@page.story = Story.find(params[:story_id])
      @page.story = Story.first       
    end
    
    def create     
      page = Page.new 
      Page.create!(page_params)
      redirect_to root_path
    end
    
    def index      
      @pages = Page.all
    end
    
    def destroy
      page = Page.find(params[:id])
      page.delete
    end
    
    def edit
      @page = Page.find(params[:id])
    end
    
    def update
         
    end
    
    private
    
    def page_params
      params.require(:page).permit(:title)
    end
    
  end
end