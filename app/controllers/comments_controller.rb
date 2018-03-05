class CommentsController < ApplicationController
	def show
		@event = Event.find(params[:id])
		@comment = @event.comments.find(params[:id])
	end

	def create
		@event = Event.find(params[:event_id])
		@comment = @event.comments.create(comment_params)
			flash[:success] = "Comment was successfully created"
		redirect_to event_path(@event)
	end
	
	def destroy
		@event = Event.find(params[:event_id])
		@comment = Comment.all.where(:event => params[:id]).first
		@comment.destroy
			flash[:danger] = "Comment was successfully destroyed"
		redirect_to event_path
	end
	
	private
		def comment_params
			params.require(:comment).permit(:body, :user_id, :event_id)
		end
end
