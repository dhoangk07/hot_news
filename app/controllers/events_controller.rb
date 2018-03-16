class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :increase_view_count]
  def index
    @events = if params[:tag]
      @events = Event.tagged_with(params[:tag])

    elsif params[:order] == 'name'
      @events = Event.order('title ASC')

    elsif params[:order] == 'id'
      @events = Event.order('created_at ASC')
    else
      @events = Event.all.order("view_count DESC")
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
    @reading = @event.readings.create(user_id: current_user.id)
  	respond_to do |format|
	    format.js
		  @event.view_count +=1
		  @event.save
		end
  end

  def hide
    @event = Event.find(params[:id])
    @hide = @event.hides.create(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def hidden
    # display hidden events of current user
    @hidden_events = Hide.includes(:event).where(:user_id => current_user)
    event_ids = @hidden_events.select(:event_id)
    #event_ids = @hidden_events.map{|hidden_event| hidden_event.event_id }
    @events = Event.where(:id => event_ids)
    if params[:order] == 'name'
      @events = Event.where(:id => event_ids).order('title ASC')
      @events.order('title ASC')
    elsif params[:order] == 'id'
      @events = Event.where(:id => event_ids).order('created_at ASC')
      @events.order('created_at ASC')
    else
      @events = Event.where(:id => event_ids).order("view_count DESC")
      @events.order("view_count DESC")
    end
  end

  def display
    @event = Event.find(params[:id])
    Hide.where(:user_id =>current_user, :event_id => params[:id]).destroy_all
    redirect_to hidden_events_path
  end

	private
	def event_params
    params.require(:event).permit(:title, :source, :tag_list)
  end

end
