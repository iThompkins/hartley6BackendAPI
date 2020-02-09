class Event < ApplicationRecord
	validates :title, presence: true
	validates :host, presence: true
	validates :time, presence: true
	validates :location, presence: true
	validates :availability, presence: true

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_one :group
end
