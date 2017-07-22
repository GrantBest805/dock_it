class SessionsController < ApplicationController
	def index
		@days = Day.all
	end

	def new

	end

	def create
		@user = User.find_by(username: params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			flash[:errors] = ["Invalid Combination"]
			redirect_to :root 
		end
	end

	def destroy
		reset_session
		redirect_to :root
	end

end
