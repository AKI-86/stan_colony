class Admin::HomesController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :authenticate_admin! 
  
  def top
  end
end
