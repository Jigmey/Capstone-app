class Post < ApplicationRecord
	belongs_to :user
	belongs_to :guild
	has_many :comments
	has_many :activities, as: :recordable
end
