class Guild < ApplicationRecord
	has_many :user_guilds
	has_many :posts
	has_many :users, through: :user_guilds
end
