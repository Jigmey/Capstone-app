class PostsController < ApplicationController

	def create
		p "starting post"
		@post=Post.new(text: params["body"][0], user_id: current_user.id, is_this_guild: params[:is_this_guild], guild_id: current_user.guilds.ids.first )
		@post.save
		p current_user.guilds.ids.first
		p @post.errors.full_messages
		p "post created?"
		#need to add the hidden field tag so that it picks up the value and creates it specifically for the guild.
		if @post=Post.where(is_this_guild: "yes")  
			redirect_to "/guilds/#{current_user.guilds.first.id}"
		else
			redirect_to '/generals'
		end
	end
		
end
