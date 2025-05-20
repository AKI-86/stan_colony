class GroupComment < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :reports, as: :reportable, dependent: :destroy
  
  validates :body, presence: true

  # コメントが削除されていないものだけを取得するスコープ
  scope :not_deleted, -> { where(deleted: false) }

  # 論理削除を行うメソッド
  def soft_delete
    update(deleted: true)
  end
end
