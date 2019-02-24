class Game < ApplicationRecord
  has_one :owner
  has_many :players
  accepts_nested_attributes_for :owner
  accepts_nested_attributes_for :players
  @now = Time.zone.now
  scope :incoming,  -> { where('closed_at > ?', @now) }

end
