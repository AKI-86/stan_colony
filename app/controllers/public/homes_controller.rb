class Public::HomesController < ApplicationController
  def top
    @recent_artists = Artist.order(created_at: :desc).limit(4)
    @active_groups = Group.order(updated_at: :desc).limit(4)
  end

  def about
  end
end
