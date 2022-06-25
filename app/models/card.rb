class Card < ApplicationRecord
  validates :title, :description, presence: true
end
