class CommentsController < ApplicationController

	def create
		p "comment start"
		@comment=Comment.create(text: params["body"][0], user_id: current_user.id, post_id: params[:post_id],  )
		p "comment created"
		redirect_to '/generals'
	end
end
