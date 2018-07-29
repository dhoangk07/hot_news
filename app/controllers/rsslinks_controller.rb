class RsslinksController < ApplicationController
  before_action :set_rsslink, only: %i[edit update show destroy]
  def index
    @rsslink = Rsslink.all
  end
  
  def new
    @rsslink = Rsslink.new
  end
  
  def create
    @rsslink = Rsslink.new(rsslink_params)
    if @rsslink.save
      flash[:success] = "Rsslink already created successfully"
      redirect_to events_path
    else
      flash.now[:error] = @rsslink.errors.full_messages.join(", ")
      render :new
    end
  end 
  
  def edit
  end
  
  def update
    if @rsslink.update(rsslink_params)
      flash[:success] = "Rsslink already updated successfully"
      redirect_to events_path
    else
      flash.now[:error] = @rsslink.errors.full_messages.join(", ")
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    if @rsslink.destroy
      flash[:danger] = "Rsslink has been deleted successfully"
      redirect_to events_path
    else
      flash.now[:error] = @rsslink.errors.full_messages.join(", ")
      redirect_to events_path
    end
  end
  
  private
    def set_rsslink
      @rsslink = Rsslink.find(params[:id])
    end
    
    def rsslink_params
      params.require(:rsslink).permit(:url)
    end
end
