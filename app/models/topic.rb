class Topic < ApplicationRecord
  has_many :t_tags, dependent: :destroy
  has_many :topic_tags, through: :t_tags
  has_many :comments, dependent: :destroy
  belongs_to :topic_genre

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
