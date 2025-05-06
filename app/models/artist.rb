class Artist < ApplicationRecord
  has_many :a_tag, dependent: :destroy
  has_many :artist_tag, through: :a_tags
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
