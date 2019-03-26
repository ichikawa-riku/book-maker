class Point < ApplicationRecord
  belongs_to :user
  belongs_to :bet, optional: true
end
