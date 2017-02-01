class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

  	def profile
    	@profile = User.find(params[:id])
  	end
  	helper_method :profile

end


# FOR LIMITING COMMENTS/POSTS Comments.0..10.each do 