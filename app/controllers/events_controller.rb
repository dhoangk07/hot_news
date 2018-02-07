class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def news
		@event = Event.new
	end

end
