# typed: strict
# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  title       :string
#  status      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Card < ApplicationRecord
  validates :title, :description, presence: true
end
