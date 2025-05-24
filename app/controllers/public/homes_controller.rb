class Public::HomesController < ApplicationController
  def top
    @recent_artists = Artist.active.order(created_at: :desc).limit(4)
    @active_groups = Group.active.order(updated_at: :desc).limit(4)
  end

  def about
  end
end
