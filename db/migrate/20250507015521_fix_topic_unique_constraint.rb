class FixTopicUniqueConstraint < ActiveRecord::Migration[6.1]
  def change
    # title に単独のユニーク制約がある場合、削除する
    remove_index :topics, :title if index_exists?(:topics, :title)

    # artist_id と title の組み合わせにユニーク制約を追加
    add_index :topics, [:artist_id, :title], unique: true
  end
end
