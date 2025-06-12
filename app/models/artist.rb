class Artist < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :a_tags, dependent: :destroy
  has_many :artist_tags, through: :a_tags
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :topics, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 250 }
  
  scope :active, -> { where(is_active: true) }

  # 指定したユーザーがそのアーティストをいいねしているかを判別
  def favorited_by?(user)
    return false if user.nil?
    favorites.exists?(user_id: user.id)
  end

  # 画像がない場合no_imageを表示、切り取って指定のサイズにリサイズする
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  # is_activeを日本語で表示
  def active_status
    is_active ? "表示中" : "非表示中"
  end

  # ransackで検索できる対象を指定
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
