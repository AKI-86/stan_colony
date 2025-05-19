class Group < ApplicationRecord
  has_one_attached :image
  
  belongs_to :owner, class_name: "User" # グループ作成者を「オーナー」として扱う
  has_many :group_memberships, dependent: :destroy
  has_many :members, through: :group_memberships, source: :user #source: :user により、group_memberships テーブルの user を members として扱う
  has_many :group_comments, dependent: :destroy

  has_many :g_tags, dependent: :destroy
  has_many :group_tags, through: :g_tags
  has_many :chat_messages, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end
end
