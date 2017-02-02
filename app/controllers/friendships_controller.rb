class FriendshipsController < ApplicationController
def show
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
        redirect_to "/generals/@user.id"
      else
        # p "nooooooo"
        flash[:error] = "Unable to add friend."
        # p friendship.errors.full_messages
        redirect_to "/generals/#{current_user.id}"
      end

  end

end

def destroy
  p "starting delete"
  p @friendship = current_user.friendships.find_by(user_id: current_user.id)
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
