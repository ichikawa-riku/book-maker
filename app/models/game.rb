class Game < ApplicationRecord
  has_one :owner
  has_many :players
  accepts_nested_attributes_for :owner
  accepts_nested_attributes_for :players
end
