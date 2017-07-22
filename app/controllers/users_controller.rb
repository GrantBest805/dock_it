class UsersController < ApplicationController

	before_action :require_login, only: [:show]
	before_action :require_correct_user, only: [:show]

	def index
	end

	def new
	end

	def create
		@group = Group.find_by(key: params[:user][:group])
		@user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], username: params[:user][:username],
			email: params[:user][:email], password: params[:user][:password],password_confirmation: params[:user][:password_confirmation], group: @group)
		
		if @user.save
			if @group.users.count == 1
				@user.manager = true
				@user.save
			else
				@user.manager = false
				@user.save
			end
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to :back
		end
	end
	
	def show
		@days = Day.all
		@user = User.find(params[:id])

	end

	def new_message
		@message = Message.new(mess_params)
	end
	
	private
		def mess_params
			params.require(:message).permit(:message, :send_to, :group_id).merge(user: current_user)
		end
end
