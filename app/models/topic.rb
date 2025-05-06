class Topic < ApplicationRecord
  has_one_attached :image

  has_many :t_tags, dependent: :destroy
  has_many :topic_tags, through: :t_tags
  has_many :comments, dependent: :destroy
  belongs_to :topic_genre
  belongs_to :artist

  validates :title, presence: true
  validates :body, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
