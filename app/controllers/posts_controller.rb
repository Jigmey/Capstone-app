class PostsController < ApplicationController

	def create
		p "starting post"
		@post=Post.create(text: params["body"][0], user_id: current_user.id, is_this_guild: "yes", guild_id: current_user.guilds.ids.first )
		p "post created?"
		#need to add the hidden field tag so that it picks up the value and creates it specifically for the guild.
		redirect_to '/generals'
	end
		
end
