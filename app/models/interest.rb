class Interest < ApplicationRecord
  has_many :activities
  has_many :events, through: :activities
end
