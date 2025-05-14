class Artist < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :a_tags, dependent: :destroy
  has_many :artist_tags, through: :a_tags
  has_many :favorites, dependent: :destroy
  has_many :topics, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  paginates_per 12

  def favorited_by?(user)
    return false if user.nil?
    favorites.exists?(user_id: user.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end
end
