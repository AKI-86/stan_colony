class TopicTag < ApplicationRecord
  has_many :t_tags, dependent: :destroy
  has_many :topics, through: :t_tags

  validates :name, presence: true, uniqueness: true
end
