class Group < ApplicationRecord
  belongs_to :owner, class_name: "User" # グループ作成者を「オーナー」として扱う
  has_many :group_memberships, dependent: :destroy
  has_many :members, through: :group_memberships, source: :user #source: :user により、group_memberships テーブルの user を members として扱う

  validates :name, presence: true
  validates :introduction, presence: true
end
