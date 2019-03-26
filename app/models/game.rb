class Game < ApplicationRecord
  has_one :user, through: :owner
  has_one :owner
  accepts_nested_attributes_for :owner
  has_many :players
  accepts_nested_attributes_for :players
  has_many :bets
  @now = Time.zone.now
  scope :incoming,  -> { where('closed_at > ?', @now) }
end
