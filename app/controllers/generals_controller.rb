class GeneralsController < ApplicationController
	def index
		@posts=Post.where(user_id:current_user)
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
		@posts=Post.where(user_id: @user)
		@comments=Comment.where(user_id:@user)
		render 'show.html.erb'
	end

	def update
	end

	def destroy
	end

end