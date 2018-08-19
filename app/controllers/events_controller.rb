class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: %i[index show increase_view_count]
  before_action :set_event, only: %i[edit update show destroy increase_view_count hide bookmark unbookmark like unlike]
  def index
    if current_user.present?
      @events = Event.where.not(id: current_user.hides.select(:event_id))
    else
      @events = Event.order("created_at DESC").page params[:page]
    end

    @events = if params[:tag]
      @events = @events.tagged_with(params[:tag])

    elsif params[:order] == 'name'
      @events = @events.order('title ASC').page params[:page]

    elsif params[:order] == 'id'
      @events = @events.order('created_at ASC').page params[:page]

    else
      @events = @events.order("view_count DESC").page params[:page]
    end

    if params[:search].present?
      @events = @events.search(params[:search])
    elsif params[:filter].present?
      @events = Event.where('source ILIKE ?', "%#{params[:filter]}%").page params[:page]
    end
  end

	def new
		@event = Event.new
	end

	def show;end

	def edit;end

  def update
    if @event.update_attributes(event_params)
      flash[:notice] = "Updated event"
      redirect_to root_path
    else
      flash.now[:error] = @event.errors.full_messages.join(", ")
      render :edit
    end
  end

  def increase_view_count
    if Reading.where(:user_id => current_user.id, :event_id => @event.id).blank?
      @reading = @event.readings.create(user_id: current_user.id)
    end
    @event.view_count +=1
    @event.save
  	respond_to do |format|
	    format.js
		end
  end

  def hide
    @hide = @event.hides.create(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def hidden
    @hidden_events = Hide.includes(:event).where(:user_id => current_user)
    event_ids = @hidden_events.select(:event_id)
    @events = Event.where(:id => event_ids)
    if params[:order] == 'name'
      @events = Event.where(:id => event_ids).order('title ASC').page params[:page]
      @events.order('title ASC')
    elsif params[:order] == 'id'
      @events = Event.where(:id => event_ids).order('created_at ASC').page params[:page]
      @events.order('created_at ASC')
    else
      @events = Event.where(:id => event_ids).order("view_count DESC").page params[:page]
      @events.order("view_count DESC")
    end
  end

  def display
    Hide.where(:user_id =>current_user, :event_id => params[:id]).destroy_all
    redirect_to hidden_events_path
  end

  def bookmark
    @bookmark = @event.bookmarks.create(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def bookmarked
    @bookmark_events = Bookmark.includes(:event).where(:user_id => current_user)
    event_ids = @bookmark_events.select(:event_id)
    @events = Event.where(:id => event_ids).page params[:page]
  end

  def unbookmark
    Bookmark.where(:user_id =>current_user, :event_id => params[:id]).destroy_all
    redirect_to bookmarked_events_path
  end

  def like
    @event.likes.create(user_id: current_user.id)
    redirect_to events_path
  end

  def unlike
    @event.likes.where(user_id: current_user.id).destroy_all
    redirect_to events_path
  end

  def history 
    @readings = Reading.where(:user_id => current_user.id)
    event_ids = @readings.select(:event_id)
    @events = Event.where(:id => event_ids).order('created_at DESC').page params[:page]
  end

	private
    def set_event
      @event = Event.find(params[:id])
    end
  	def event_params
      params.require(:event).permit(:title, :source, :tag_list, :search)
    end
end
