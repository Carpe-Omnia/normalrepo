class UsersController < ApplicationController
	def new
		@user = User.new 
	end 
	
	def create 
		@user = User.new(user_params(:email, :name, :password) )
		if @user.save 
			@user.update(karma: 0)
			session[:user_id] = @user.id 
			redirect_to user_path(@user)
		else 
			render "new" 
		end 	
	end
	
	def show 
		@user = User.find_by(id: params[:id]) 
	end 
	
	def login 
		@message = ""
	end 
	
	def authorize 
		@user = User.find_by(name: params[:name]) 
		if @user.authenticate(params[:password]) 
			session[:user_id] = @user.id 
			redirect_to '/'
		else 
			@message = "incorrect username or password, please try again" 
			render "login" 
		end 	
	end 
	
	def logout 
		session.clear 
		redirect_to '/'
	end 	
	
	
	private 
	
	def user_params(*args) 
		params.require(:user).permit(*args)
	end 	
	

end
