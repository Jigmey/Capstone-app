class GuildsController < ApplicationController
	def new
		render 'new.html.erb'
	end

	def join
		render 'join.html.erb'
	end

	def search
		p "test"
		@guild= Guild.find(params[:id])
		p "test2"
		guildname=Guild.find_by name:(params[:guildname])
		p "test3"
		redirect_to "/guilds/#{@guild.id}"
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

	def createGuild
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

	def joinGuild
		if !@user_guilds.nil?
			redirect_to '/generals'
		else
			@joinguild=UserGuild.new(
				user_id: current_user.id,
				guild_id: params[:guild_id])
			p "start join"
			if @joinguild.save
				flash[:success]="You Joined A Guild!"
				redirect_to "/guilds/#{current_user.guilds.ids.first}"
				p "finishing join"
			else
				p "did not join"
				flash[:error]= "You did not join a guild"
				redirect_to '/generals'
			end
		end
		
	end
	def destroy
		p "start"
		p leaveguild = current_user.user_guilds.find_by(guild_id: current_user.guilds.first.id)
		p "deleting"
		leaveguild.destroy
		flash[:notice]= "You are out of the guild"
		redirect_to "/generals/#{current_user.id}"
		
	end
end
