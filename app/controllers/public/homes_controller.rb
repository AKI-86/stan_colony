class Public::HomesController < ApplicationController
  def top
    @recent_artists = Artist.active.order(created_at: :desc).limit(4)
    # @active_groups = Group.active.order(updated_at: :desc).limit(4)
    @active_groups = Group.active
    .left_joins(:group_comments)
    .select('groups.*, MAX(group_comments.created_at) as last_commented_at')
    .group('groups.id')
    .order(Arel.sql('last_commented_at DESC NULLS LAST'))
    .limit(4)
  end

  def about
  end
end
