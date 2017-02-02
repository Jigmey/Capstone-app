class PostsController < ApplicationController

	def create
		p "starting post"
		@post=Post.new(text: params["body"][0], user_id: current_user.id, is_this_guild: params[:is_this_guild],is_this_profile: params[:is_this_profile], guild_id: current_user.guilds.ids.first )
		@post.save
		p current_user.guilds.ids.first
		p @post.errors.full_messages
		p "post created?"
		#need to add the hidden field tag so that it picks up the value and creates it specifically for the guild.
		if @post=Post.where(user_id:current_user.id).last.is_this_guild == "no" && @post=Post.where(user_id: profile.id).last.is_this_profile == "no"
			redirect_to '/generals'
		elsif @post=Post.where(user_id:current_user.id ).last.is_this_guild == "yes" && @post=Post.where(user_id: profile.id).last.is_this_profile == "no"
			redirect_to "/guilds/#{profile.guilds.first.id}"
		elsif @post=Post.where(user_id:current_user.id).last.is_this_profile == "yes" && @post=Post.where(user_id: profile.id).last.is_this_guild == "no"
			redirect_to "/generals/#{profile.id}"
		end
	end
		
end
