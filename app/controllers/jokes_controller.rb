class JokesController < ApplicationController 
	def index
		@message = ""
		@jokes = Joke.all 
	end
	def new 
		if session[:user_id] != nil
			@joke = Joke.new 
		else 
			@message = "You must be signed in to create a joke"
			render "index"
		end 	
	end 
	
	def create 
		@joke = Joke.new(joke_params(:setup, :punchline)) 
		@user = User.find_by(id: session[:user_id]) 
		if @joke.update(author_id: @user.id, karma: 0)  
			@message = "Your joke has been created" 
			@jokes = Joke.all 
			render "index"
		else 
			render "new" 
		end 	
	end 
	
	private 
	
	def joke_params(*args) 
		params.require(:joke).permit(*args) 
	end 	
	
	
end 