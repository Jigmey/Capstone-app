class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

    def user_path_way
      @user = User.find(params [:id])  
    end
    helper_method :user_path_way

end
