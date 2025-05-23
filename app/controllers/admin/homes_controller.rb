class Admin::HomesController < ApplicationController
  before_action :authenticate_admin! 
  
  def top
    @recent_reports = Report.order(created_at: :desc).limit(5)
    @users = User.without_guests.includes(:artists, :topics, :owned_groups, :comments).order(created_at: :desc).limit(5)
    @artists = Artist.order(created_at: :desc).limit(5)

    @reports = Report.order(created_at: :desc).limit(5)
  end
end
