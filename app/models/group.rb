class Group < ApplicationRecord
	has_many :users
	belongs_to :event
end
