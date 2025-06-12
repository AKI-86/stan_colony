class Topic < ApplicationRecord
  has_one_attached :image

  has_many :t_tags, dependent: :destroy
  has_many :topic_tags, through: :t_tags
  has_many :comments, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  belongs_to :topic_genre
  belongs_to :artist
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }

  scope :active, -> { where(is_active: true) }

  # 画像がない場合no_imageを表示、切り取って指定のサイズにリサイズする
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # is_activeを日本語で表示
  def active_status
    is_active ? "表示中" : "非表示中"
  end

  # ransackで検索できる対象を指定
  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end
end
