class GroupTag < ApplicationRecord
  has_many :g_tags, dependent: :destroy
  has_many :groups, through: :g_tags

  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
end
