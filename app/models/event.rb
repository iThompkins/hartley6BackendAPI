class Event < ApplicationRecord
	validates :title, presence: true, length: { maximum: 25 }
	validates :host, presence: true, length: { maximum: 25 }
	validates :time, presence: true, length: { maximum: 25 }
	validates :location, presence: true, length: { maximum: 25 }
	validates :availability, presence: true

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_one :group
end
