class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
	def index
		@users = User.all
	end
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the alpha blog #{@user.username}"
  		redirect_to edit_user_path(@user)
  	else
      flash.now[:error] = @user.errors.full_messages.join(", ")
  		render 'new'
  	end
  end

  def edit;end

  def update
  	if @user.update(user_params)
  		flash[:success] = "Your account was updated successfully" 
  		redirect_to edit_user_path(@user)
  	else
      flash.now[:error] = @user.errors.full_messages.join(", ")
  		render 'edit'
  	end
  end

  def show;end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      if params[:user][:password].blank?
    	  params.require(:user).permit(:name, :email, :photo)
      else
        if params[:user][:photo].blank?
          params.require(:user).permit(:name, :email, :password)
        else
          params.require(:user).permit(:name, :email, :password, :photo)
        end
      end
    end
end