class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :increase_view_count]
  def index
    @events = if params[:tag]
      @events = Event.tagged_with(params[:tag])
    else
      @events = Event.all
    end
  end

	def new
		@event = Event.new
	end

	def show
   @event = Event.find(params[:id])
  end

	def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Updated event"
      redirect_to root_path
    else
      render :edit
    end
  end

  def increase_view_count
  	@event = Event.find(params[:id])
  	respond_to do |format|
	    format.js
		  @event.view_count +=1
		  @event.save
		end
  end

	private
	def event_params
    params.require(:event).permit(:title, :source, :tag_list)
  end

end
