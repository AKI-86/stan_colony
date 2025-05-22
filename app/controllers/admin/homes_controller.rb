class Admin::HomesController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :authenticate_admin! 
  
  def top
    @recent_reports = Report.order(created_at: :desc).limit(5)
  end
end
