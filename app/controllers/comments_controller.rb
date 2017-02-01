class CommentsController < ApplicationController

	def create
		p "comment start"
		@comment=Comment.create(text: params["body"][0], user_id:current_user.id, post_id: params[:post_id],is_this_profile: params[:is_this_profile], is_this_guild: params[:is_this_guild]  )
		p "comment created"
		if @comment=Comment.where(user_id: current_user.id).last.is_this_guild == "no" && @comment=Comment.where(user_id: current_user.id).last.is_this_profile == "no"
			redirect_to '/generals'
		elsif @comment=Comment.where(user_id: current_user.id).last.is_this_guild == "yes" && @comment=Comment.where(user_id: current_user.id).last.is_this_profile == "no"
			redirect_to "/guilds/#{current_user.guilds.first.id}"
		elsif @comment=Comment.where(user_id: current_user.id).last.is_this_profile == "yes" && @comment=Comment.where(user_id: current_user.id).last.is_this_guild == "no"
			redirect_to "/generals/#{profile.id}"
		end
	end
end
