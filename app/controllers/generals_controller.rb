class GeneralsController < ApplicationController
	def index
		if params[:page] == 2
			@posts=Post.where(user_id:current_user).limit(1).offset(1)
		else
			@posts=Post.where(user_id:current_user).limit(1)
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
		@posts=Post.where(user_id: @user)
		@comments=Comment.where(user_id:@user)
		render 'show.html.erb'
	end

	def update
	end

	def destroy
	end

end