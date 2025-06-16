class Admin::HomesController < ApplicationController
  before_action :authenticate_admin! 
  
  def top
    @unchecked_report_count = Report.where(status: "unchecked").count
    @guest_user_count = User.where(guest: true).count
    @artist_count = Artist.count
    @group_count = Group.count
    @users = User.without_guests.includes(:artists, :topics, :owned_groups, :comments).order(created_at: :desc).limit(5)
    @user_count = User.where(guest: [false, nil]).count
    @groups = Group.order(created_at: :desc).limit(5)
    @artists = Artist.order(created_at: :desc).limit(5)
    @reports = Report.order(created_at: :desc).limit(5)
  end
end
