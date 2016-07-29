class MessagesController < ApplicationController
	def create
		user = User.find(session[:user_id])
		message = user.messages.new(message_params)
		flash[:errors] = message.errors.full_messages unless message.save
		redirect_to :back
	end

	private
	def message_params
		params.require(:message).permit(:content)
	end
end
