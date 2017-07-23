class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons

  validates :section, presence: true, length: { minimum: 5, maximum: 30 }
end
