class Event < ApplicationRecord
  belongs_to :user
  belongs_to :week
  belongs_to :group
end
