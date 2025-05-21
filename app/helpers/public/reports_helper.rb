module Public::ReportsHelper
  def reportable_path(reportable)
    case reportable
    when User
      user_path(reportable)
    when Artist
      artist_path(reportable)
    when Topic
      artist_topic_path(reportable.artist, reportable)
    when Group
      group_path(reportable)
    when Comment
      artist_topic_path(reportable.topic.artist, reportable.topic)
    when GroupComment
      group_path(reportable.group)
    else
      root_path
    end
  end
end
