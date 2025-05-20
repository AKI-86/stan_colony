class Public::ReportsController < ApplicationController
  before_action :authenticate_user!

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

  def reportable_path(reportable)
    case reportable
    when Artist
      artist_path(reportable)
    when Topic
      artist_topic_path(reportable.artist, reportable)
    when Group
      group_path(reportable)
    when Comment
      artist_topic_path(reportable.topic.artist, reportable.topic)
    when GroupComment
      group_path(reportable.group)
    else
      root_path
    end
  end

  def find_reportable
    # パラメータで渡されたparams[:reportable_type], params[:reportable_id] で通報対象を取得
    params[:reportable_type].constantize.find(params[:reportable_id])
  end

  def report_params
    params.require(:report).permit(:reason)
  end
end
