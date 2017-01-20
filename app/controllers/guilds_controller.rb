class GuildsController < ApplicationController
	def new
		render 'new.html.erb'
	end

	def show

		@user_guilds=UserGuild.where(guild_id: current_user.guilds.ids)
		
		guild= Guild.find(params[:id])
		
		if current_user.guilds.ids.first != guild.id
			redirect_to '/generals'
		else	
			@posts=Post.where(is_this_guild: "yes").where(guild_id: current_user.guilds.ids.first)#this is what you need to add so that only guild post are shown.
			@comments=Comment.where(user_id:current_user).where(is_this_guild: "yes").where(guild_id: current_user.guilds.ids.first)
			render 'show.html.erb'
		end
	end

	def create
		@new_guild= Guild.new(
			name: params[:name],
			description: params[:description],
			)
		p @new_guild.users.ids


		if @new_guild.save
			p flash[:success] = 'Guild created!'
			p "start"
			current_user_guild=UserGuild.find_by(user_id: current_user.id)
			p "found"

			p "start update"
			if current_user_guild.guild == nil
				current_user_guild.update(guild_id: @new_guild.id)
			end
			p "updated"
	
			redirect_to "/generals/#{current_user.id}"
		else
			p flash[:warning] = 'Sorry Guild not created'
			redirect_to "/generals/#{current_user.id}"
		end
			
		
	end
end
