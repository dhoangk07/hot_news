class EventsController < ApplicationController

	def index
		@events = Event.all
  end

  def increase_view_count
  	@event = Event.find(params[:id])
  	respond_to do |format|
	    format.js
	  @event.view_count +=1
	  @event.save
	  end

  end

	def news
		@event = Event.new
	end

	private
	def event_params
    params.require(:event).permit(:title, :source)
  end

end
