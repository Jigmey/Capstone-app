class Photo < ApplicationRecord
	belongs_to :user
	has_many :activities, as: :recordable
end

