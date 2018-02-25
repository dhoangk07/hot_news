class EventsController < ApplicationController
	def index
    @events = Event.all
  end

	def news
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
      redirect_to root_path, notice: 'Updated article.'
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
