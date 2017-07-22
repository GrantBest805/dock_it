class GroupsController < ApplicationController


	def index
		@days = Day.all
		@user = User.find(current_user.id)
		@group = Group.find(params[:id])
	end

	def create
  	@group = Group.new(group_params)
  	if @group.save
  		flash[:notice] = "Group Was created!"
  		redirect_to "groups/#{@group.id}" 
  	else
  		flash[:errors] = @group.errors.full_messages
  		redirect_to "users/new" 
  	end
  end

  def add_title
  	@user = User.find_by(username: params[:title][:username])
  	@group = Group.find(params[:title][:group_id])
  	@title = Title.new(title: params[:title][:title], group: params[:title][:group_id], user: @user)
  	if @title.save
  		flash[:notice] = "Title Created!"
  		redirect_to "groups/#{@group.id}"
  	else
  		flash[:errors] = @title.errors.full_messages
  		redirect_to "groups/#{@group.id}"
  	end
  end

  private
  
  	def group_params
   		params.require(:group).permit(:name, :location, :key)
  	end
end














































