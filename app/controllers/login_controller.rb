class LoginController < ApplicationController
	def new
		
	end
	def create
		 user = User.find_by(name: params[:name])
	    if user && user.authenticate(params[:password])
	      session[:user_id] = user.id
	      flash[:success] = 'Successfully logged in!'
	      redirect_to '/generals'
	    else
	      flash[:warning] = 'Invalid email or password!'
	      redirect_to '/login'
		end
	end
	def destroy
		session[:user_id] = nil
    	flash[:success] = 'Successfully logged out!'
		redirect_to '/generals'
	end
end
