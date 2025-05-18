# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Admin)
      can :manage, :all         # 管理者は全権限
    else
      cannot :access, :rails_admin  # 他は管理画面アクセス禁止
    end
  end
end
