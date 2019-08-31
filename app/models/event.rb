class Event < ApplicationRecord
	validates :title, presence: true
	validates :host, presence: true
	validates :category, presence: true
	validates :time, presence: true
	validates :availability, presence: true

	belongs_to :user
end
