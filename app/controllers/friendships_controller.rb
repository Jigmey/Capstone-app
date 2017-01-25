class FriendshipsController < ApplicationController
def show
  @user= User.find(params[:id])
  render 'show.html.erb'
end

def create 
  # p "hello"
  # p current_user.friends.ids
  # p params[:friend_id]
  if current_user.friends.ids.include?(params[:friend_id].to_i)
    # p "shamalan"
    flash[:error] = "Friend already added"
    redirect_to '/generals'
  else
    # p "badoom"
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        # p "woohoo"
        flash[:success] = "Added friend."
        redirect_to '/generals'
      else
        # p "nooooooo"
        flash[:error] = "Unable to add friend."
        # p friendship.errors.full_messages
        redirect_to '/generals'
      end

  end

end

def destroy
  p "starting delete"
  p @friendship = current_user.friendships.find_by(params[:friendship_id].to_i)
  p "finding id"
  @friendship.destroy
  p "deleting"
  flash[:notice] = "Removed friendship."
  redirect_to '/generals'
end

def all_friends
  @friends ||= current_user.friends.all
end

end
