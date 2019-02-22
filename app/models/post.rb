class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # has_one_attached :image
  validates :title , presence: true
  validates :start_time , presence: true

end
