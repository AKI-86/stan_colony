RailsAdmin.config do |config|
  config.asset_source = :webpacker

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    show
    edit
    show_in_app
    # 論理削除を採用しているため不要
    # delete
    # bulk_delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # ダッシュボード・サイドバーに表示しない
  config.model 'ATag' do
    visible false  
  end
  config.model 'TTag' do
    visible false
  end
end
