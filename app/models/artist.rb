class Artist < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :a_tag, dependent: :destroy
  has_many :artist_tag, through: :a_tags
  has_many :favorites, dependent: :destroy
  has_many :topics, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
