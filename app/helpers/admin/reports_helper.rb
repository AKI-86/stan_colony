module Admin::ReportsHelper
  def reportable_link(report)
    case report.reportable_type
    when "User"
      link_to admin_user_path(report.reportable.id) do
        content_tag(:i, "", class: "fa-solid fa-user mr-1") +
        report.reportable.name
      end
    when "Artist"
      link_to admin_artist_path(report.reportable.id) do
        content_tag(:i, "", class: "fa-solid fa-music mr-1") +
        report.reportable.name
      end
    when "Topic"
      topic = report.reportable
      link_to artist_topic_path(topic.artist, topic) do
        content_tag(:i, "", class: "fa-solid fa-list mr-1") +
        truncate(topic.title, length: 20)
      end
    when "Group"
      link_to admin_group_path(report.reportable.id) do
        content_tag(:i, "", class: "fa-solid fa-users mr-1") +
        report.reportable.name
      end
    when "Comment"
      comment = report.reportable
      topic = comment.topic
      artist = topic.artist
      link_to artist_topic_path(artist, topic) do
        content_tag(:i, "", class: "fa-solid fa-comment mr-1") +
        truncate(comment.body, length: 10)
      end
    when "GroupComment"
      group_comment = report.reportable
      group = group_comment.group
      link_to group_path(group) do
        content_tag(:i, "", class: "fa-solid fa-comments mr-1") +
        truncate(group_comment.body, length: 10)
      end
    else
      "不明な対象"
    end
  end

  def comment_number_for(report)
    case report.reportable_type
    when "Comment"
      comment = report.reportable
      topic = comment.topic
      comments = topic.comments.order(created_at: :desc).pluck(:id)
      index = comments.index(comment.id)
      comments.size - index if index

    when "GroupComment"
      group_comment = report.reportable
      group = group_comment.group
      group_comments = group.group_comments.order(created_at: :desc).pluck(:id)
      index = group_comments.index(group_comment.id)
      group_comments.size - index if index
    else
      nil
    end
  end

end