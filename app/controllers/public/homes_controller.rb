class Public::HomesController < ApplicationController
  def top
    @recent_artists = Artist.active.order(created_at: :desc).limit(4)
    @active_groups = Group.active.order(created_at: :desc).limit(4)
    # @active_groups = Group.active.left_joins(:group_comments).group('groups.id').order(Arel.sql('MAX(group_comments.created_at) DESC NULLS LAST')).limit(4)
  end

  def about
  end
end
