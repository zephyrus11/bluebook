class UsersController < ApplicationController
  # def show
    # @user = User.find(params[:id])
  # end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to bluebook"
  		redirect_to '/'
  	else
  		render 'new'
  		flash[:notice]= "Email/Username has been taken."
  	end
  end


  private

  def user_params
  	params.require(:user).permit(:username, :email, :password)
  	
  end
end
