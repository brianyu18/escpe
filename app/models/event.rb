class Event < ApplicationRecord
  has_many :guestlists
  has_many :activities
  has_many :interests, through: :activities
  has_many :users, through: :guestlists
end
