class AddReferencesToTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :topic, :topic_genre, null: false, foreign_key: true
  end
end
