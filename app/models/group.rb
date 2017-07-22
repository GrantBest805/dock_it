class Group < ApplicationRecord
	has_many :events
	has_many :titles
	has_many :users
	has_many :weeks
	has_many :messages
	validates :name, presence: true
	validates :key, presence: true, uniqueness: true
end
