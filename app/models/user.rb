class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :without_guests, -> { where(guest: [false, nil]) }
  scope :active, -> { where(is_active: true) }
  
  has_one_attached :image
  
  has_many :artists
  has_many :topics
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # いいねをしたユーザー一覧で非アクティブなアーティストを拾ってしまう
  has_many :favorite_artists, -> { merge(Artist.active) }, through: :favorites, source: :artist
  has_many :owned_groups, class_name: "Group", foreign_key: "owner_id", dependent: :destroy
  has_many :group_memberships, dependent: :destroy
  has_many :joined_groups, through: :group_memberships, source: :group
  has_many :chat_messages, dependent: :destroy

  has_many :reports, dependent: :destroy
  has_many :reports_received, as: :reportable, class_name: "Report", dependent: :destroy # 通報されたもの

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :gender, inclusion: { in: ["男性", "女性", "その他", "未回答"] }, allow_blank: true
  validates :age, inclusion: { in: ["10代以下", "20代", "30代", "40代", "50代", "60代以上"] }, allow_blank: true


  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed
  
  # 指定したユーザーをフォロー
  def follow(user)
    relationships.create(followed_id: user.id)
  end
  # 指定したユーザーのフォローを解除
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end
  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    followings.include?(user)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  # 退会処理、is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && is_active
  end

  # ゲストユーザー機能 selfなのでクラスメソッド、User.guestで呼び出せる
  def self.guest 
    unique_token = SecureRandom.hex(4)
    guest_name = "ゲスト-#{unique_token}"
    guest_email = "guest-#{unique_token}@example.com"

    find_or_create_by!(email: guest_email) do |user|
      # SecureRandom.urlsafe_base64:ランダムな文字列を生成するRubyのメソッド
      user.password = SecureRandom.urlsafe_base64
      user.name = guest_name
      user.guest = true
    end
  end

  #ゲストユーザーなら各投稿を禁止
  def guest?
    guest == true
  end

  def active_status
    is_active ? "有効" : "退会済み"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def followed_users_favorite_artists_except_mine
    # フォロー中のユーザーのIDを取得
    followed_user_ids = self.followings.pluck(:id)
  
    # フォロー中ユーザーがいいねしたアーティストのID
    artist_ids_liked_by_followed_users = Favorite.where(user_id: followed_user_ids).pluck(:artist_id)
  
    # 自分がいいねしたアーティストのID
    my_favorite_artist_ids = self.favorite_artists.pluck(:id)
  
    # 自分のいいねを除外し、アクティブなアーティストからランダムに9件取得
    Artist.active.where(id: artist_ids_liked_by_followed_users - my_favorite_artist_ids).sample(6)
  end
end
