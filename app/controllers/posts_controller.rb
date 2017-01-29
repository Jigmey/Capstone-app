class PostsController < ApplicationController

	def create
		@user = User.find(params[:id])
		p "starting post"
		@post=Post.new(text: params["body"][0], user_id: current_user.id || @user.id, is_this_guild: params[:is_this_guild],is_this_profile: params[:is_this_profile], guild_id: current_user.guilds.ids.first )
		@post.save
		p current_user.guilds.ids.first
		p @post.errors.full_messages
		p "post created?"
		#need to add the hidden field tag so that it picks up the value and creates it specifically for the guild.
		if @post=Post.where(user_id: current_user || @user.id).last.is_this_guild == "no" && @post=Post.where(user_id: @user.id).last.is_this_profile == "no"
			redirect_to '/generals'
		elsif @post=Post.where(user_id: current_user.id || @user.id).last.is_this_guild == "yes"
			redirect_to "/guilds/#{@user.guilds.first.id}"
		elsif @post=Post.where(user_id: current_user.id || @user.id).last.is_this_profile == "yes"
			redirect_to "/generals/#{@user.id}"
		end
	end
		
end
