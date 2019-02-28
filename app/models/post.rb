class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # has_one_attached :image
  validates :title , presence: true
  validates :start_time , presence: true
  has_many :likes, dependent: :destroy

  def iiyome(user)
    likes.create(user_id: user.id)
  end

  def uniiyome(user)
    likes.find_by(user_id: user.id).destroy
  end

  has_many :iiyome_users, through: :likes, source: :user

  def iiyome?(user)
    iiyome_users.include?(user)
  end

end
