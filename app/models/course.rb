class Course < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true, length: { minimum: 20, maximum: 160 }
  validates :cost, presence: true
end
