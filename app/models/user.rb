class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, through: :owner
  has_many :owner
  has_many :bets
end
