class Course < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true, length: { minimum: 15, maximum: 160 }
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end