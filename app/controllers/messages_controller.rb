class MessagesController < ApplicationController 

	def new 
		@sender = User.find_by(id: session[:user_id]) 
		@target = User.find_by(id: params[:to]) 
	end 
	
	def create 
		sender = User.find_by(id: session[:user_id] ) 
		receiver = User.find_by(id: params[:to_id])
		convo = Conversation.find_by_users(sender, receiver) 
		@message = Message.new(from_id: sender.id, to_id: receiver.id , subject: params[:subject], content: params[:content], conversation_id: convo.id ) 
		if @message.save && convo.save 
			@user = receiver
			@bio = receiver.bio 
			@confirmation = "Message sent" 
			render "users/show"
		else 
			render "new" 
		end 	
	end 
	
	def inbox 
		@inbox = User.find_by(id: session[:user_id]).inbox 
	end 
	
	def sendreply 
		sender = User.find_by(id: session[:user_id] ) 
		convo = Conversation.find_by(id: params[:to_id])
		@message = Message.create(from_id: session[:user_id], subject: params[:subject], content: params[:content], conversation_id: convo.id ) 
		redirect_to '/inbox' 
	end 
	
	def conversation 
		@conversation = Conversation.find_by(id: params[:convo_id]) 
	end 
	
end 
