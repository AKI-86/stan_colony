class RemoveUniqueIndexFromTopics < ActiveRecord::Migration[6.1]
  def change
    remove_index :topics, column: [:artist_id, :title]
  end
end
