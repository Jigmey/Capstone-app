class UsersController < ApplicationController
	def new
	end
	def create
		@user = User.new(
	      name: params[:name],
	      birthdate: params[:birthdate],
	      password: params[:password],
	      password_confirmation: params[:password_confirmation]
	    )

	    if @user.save
	      p flash[:success] = 'Successfully created account!'
	      redirect_to '/login'
	    else
	      p flash[:warning] = 'Invalid email or password!'
	      redirect_to '/users/signup'
	    end
	end
end
