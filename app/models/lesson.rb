class Lesson < ApplicationRecord
  belongs_to :section
  mount_uploader :video, VideoUploader

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :subtitle, presence: true, length: { minimum: 5, maximum: 30}
end
