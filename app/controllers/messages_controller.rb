class MessagesController < ApplicationController 

	def new 
		@sender = User.find_by(id: session[:user_id]) 
		@target = User.find_by(id: params[:to]) 
	end 
	
	def create 
		@message = Message.new(from_id: session[:user_id], to_id: params[:to_id], subject: params[:subject], content: params[:content]) 
		if @message.save 
			@user = User.find_by(id: params[:to_id])
			@bio = Bio.find_by(user_id: @user.id) 
			@confirmation = "Message sent" 
			render "users/show"
		else 
			render "new" 
		end 	
	end 
	
	def inbox 
		@inbox = User.find_by(id: session[:user_id]).inbox 
	end 
	
end 
