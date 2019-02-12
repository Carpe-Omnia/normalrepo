class BiosController < ApplicationController 
	def create 
		@bio = Bio.create(headline: params[:bio][:headline], content: params[:bio][:content], user_id: session[:user_id])
		redirect_to user_path(session[:user_id])
	end 
	def update 
		@bio = Bio.find_by(id: params[:id]) 
		@bio.update(headline: params[:bio][:headline], content: params[:bio][:content])
		redirect_to user_path(session[:user_id])
	end 
end
