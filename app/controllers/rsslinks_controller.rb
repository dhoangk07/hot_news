class RsslinksController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  def index
  end
  
  def new
  end
  
  def create
  end 
  
  def edit
  end
  
  def update
  end
  
  def show
  end
  
  def destroy
  end
  
  
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
