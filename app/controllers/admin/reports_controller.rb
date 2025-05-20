class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reports = Report.includes(:user, :reportable).order(created_at: :desc)
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to admin_report_path(@report), notice: "通報内容を更新しました。"
    else
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason)
  end
end
