class TTag < ApplicationRecord
  belongs_to :topic
  belongs_to :topic_tag
end
