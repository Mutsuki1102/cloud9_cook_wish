class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # has_one_attached :image

end
