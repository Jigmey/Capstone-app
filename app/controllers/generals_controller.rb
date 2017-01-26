class GeneralsController < ApplicationController
	def index
		@page=params[:page].to_i+1
		if params[:page]
			@posts=Post.where(user_id:current_user).limit(3).order("created_at desc").offset(@page*3-3)
		else 
			@posts=Post.where(user_id:current_user).limit(3).order("created_at desc")
		end
		@comments=Comment.where(user_id:current_user)
		render 'index.html.erb'
	end

	def new
	end

	def create

	end

	def edit
	end

	def show
		@user= User.find(params[:id])
		p current_user.friendships.where(user_id: current_user.id).where(friend_id: @user.id)
		@page=params[:page].to_i+1
		if params[:page]
			@posts=Post.where(user_id:current_user).limit(4).order("created_at desc").offset(@page*4-4)
		else 
			@posts=Post.where(user_id:current_user).limit(4).order("created_at desc")
		end
		@comments=Comment.where(user_id:@user)
		render 'show.html.erb'
	end

	def update
	end

	def destroy
	end

end