class Public::ReportsController < ApplicationController
  before_action :authenticate_user!
  include Public::ReportsHelper

  def new
    # 通報対象の取得（パラメータで渡す）
    @reportable = find_reportable
    @report = Report.new
  end

  def create
    @reportable = find_reportable
    @report = current_user.reports.new(report_params)
    @report.reportable = @reportable
  
    if @report.save
      redirect_to reportable_path(@reportable), notice: "通報を送信しました。"
    else
      render :new
    end
  end

  private

  def find_reportable
    # パラメータで渡されたparams[:reportable_type], params[:reportable_id] で通報対象を取得
    params[:reportable_type].constantize.find(params[:reportable_id])
  end

  def report_params
    params.require(:report).permit(:reason, :reason_category)
  end
end
