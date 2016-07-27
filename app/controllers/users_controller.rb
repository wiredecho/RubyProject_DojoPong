class UsersController < ApplicationController
  def index
    @opponents = User.all.sort_by{|p| -p[:wins]}
  end

  def create
  	if params[:invitecode] === 'tacocat'
  	 user = User.new(user_params)
     user.wins=0
     user.losses=0
      if user.save
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to :back
      end
    else
      flash[:errors] = ['Your invitecode did not work']
      redirect_to :back
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :cohort, :email, :password, :password_confirmation, :invitecode, :wins, :losses)
  end
end