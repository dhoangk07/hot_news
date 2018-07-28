class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :increase_view_count]
  def index
    if current_user.present?
      @events = Event.where.not(id: current_user.hides.select(:event_id))
    else
      @events = Event.order("created_at DESC").all
    end

    @events = if params[:tag]
      @events = @events.tagged_with(params[:tag])

    elsif params[:order] == 'name'
      @events = @events.paginate(page: params[:page], per_page: 5).order('title ASC')

    elsif params[:order] == 'id'
      @events = @events.paginate(page: params[:page], per_page: 5).order('created_at ASC')

    else
      @events = @events.paginate(page: params[:page], per_page: 5).order("view_count DESC")
    end

    if params[:search].present?
      @events = @events.search(params[:search])
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
      @events = Event.paginate(page: params[:page], per_page: 5).where(:id => event_ids).order('title ASC')
      @events.order('title ASC')
    elsif params[:order] == 'id'
      @events = Event.paginate(page: params[:page], per_page: 5).where(:id => event_ids).order('created_at ASC')
      @events.order('created_at ASC')
    else
      @events = Event.paginate(page: params[:page], per_page: 5).where(:id => event_ids).order("view_count DESC")
      @events.order("view_count DESC")
    end
  end

  def display
    @event = Event.find(params[:id])
    Hide.where(:user_id =>current_user, :event_id => params[:id]).destroy_all
    redirect_to hidden_events_path
  end

  def bookmark
    @event = Event.find(params[:id])
    @bookmark = @event.bookmarks.create(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def bookmarked
    @bookmark_events = Bookmark.includes(:event).where(:user_id => current_user)
    event_ids = @bookmark_events.select(:event_id)
    @events = Event.paginate(page: params[:page], per_page: 5).where(:id => event_ids)
  end

  def unbookmark
    @event = Event.find(params[:id])
    Bookmark.where(:user_id =>current_user, :event_id => params[:id]).destroy_all
    redirect_to bookmarked_events_path
  end

  def like
    @event = Event.find(params[:id])
    @event.likes.create(user_id: current_user.id)
    redirect_to events_path
  end

  def unlike
    @event = Event.find(params[:id])
    @event.likes.where(user_id: current_user.id).destroy_all
    redirect_to events_path
  end

  def history 
    @readings = Reading.where(:user_id => current_user.id)
    event_ids = @readings.select(:event_id)
    @events = Event.paginate(page: params[:page], per_page: 10).where(:id => event_ids).order('created_at DESC')
  end

	private
  	def event_params
      params.require(:event).permit(:title, :source, :tag_list, :search)
    end
end
