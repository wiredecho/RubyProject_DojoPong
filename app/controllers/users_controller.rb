class UsersController < ApplicationController
  def index
  end

  def create
  	if params[:invitecode] === 'tacocat'
  	 user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to :back
      else
        flash[:errors] = user.errors.full_messages
        redirect_to :back
      end
    else
      redirect_to :back
    end

  	# }else{
  	# 	redirect_to '/'
  	# }

  end

  private
  def user_params
  	params.require(:user).permit(:name, :cohort, :email, :password, :password_confirmation, :invitecode, :wins, :losses)
  end
end