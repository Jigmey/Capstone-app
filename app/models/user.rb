class User < ApplicationRecord
	has_secure_password
	has_many :photos
	has_many :posts
	has_many :comments
	has_many :user_guilds
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	has_many :guilds, through: :user_guilds
	has_many :activities, as: :recordable
	has_many :actions, class_name: 'Activity'
end
