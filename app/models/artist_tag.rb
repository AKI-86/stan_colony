class ArtistTag < ApplicationRecord
  has_many :a_tags, dependent: :destroy
  has_many :artists, through: :a_tags

  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
end
