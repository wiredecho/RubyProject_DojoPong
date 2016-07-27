class UsersController < ApplicationController
  def index
  end

  def create
  	# if((:invitecode}=="tacocat"){
  	user = User.new(user_params)

  	# }else{
  	# 	redirect_to '/'
  	# }

  	if user.save
  		session[:user_id] = user.id
  		redirect_to "/"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to '/'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :cohort, :email, :password, :password_confirmation, :invitecode, :wins, :losses)
  end
end