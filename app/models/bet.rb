class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :player
  has_one :point
end
