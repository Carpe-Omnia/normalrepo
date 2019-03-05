class JokesController < ApplicationController

	def index
		@message = ""
		@jokes = Joke.all.reverse
	end

	def new
		if session[:user_id] != nil
			@joke = Joke.new
		else
			@message = "You must be signed in to create a joke"
			@jokes = Joke.all
			render "index"
		end
	end

	def create
		@joke = Joke.new(joke_params(:setup, :punchline))
		@user = User.find_by(id: session[:user_id])
		if @joke.update(author_id: @user.id, karma: 0, user_name: @user.name)
			@message = "Your joke has been created"
			@jokes = Joke.all
			render "index"
		else
			render "new"
		end
	end

	def show
		@joke = Joke.find_by(id: params[:id])
	end

	def comment
		@joke = Joke.find_by(id: params[:joke])
		@user = User.find_by(id: session[:user_id])
		@comment = JokeComment.new(joke_id: @joke.id, user_id: @user.id, user_name: @user.name, content: params[:content], karma: 0)
		@joke.joke_comments << @comment
		@comment.save
		#redirect_to "/jokes/#{@joke.id}"
		render 'show_comment', :layout => false 
	end

	private

	def joke_params(*args)
		params.require(:joke).permit(*args)
	end


end
