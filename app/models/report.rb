class Report < ApplicationRecord
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  enum status: { unchecked: 0, no_action_needed: 1, handled: 2 }
  enum reason_category: { inappropriate: 0, spam: 1, other: 2 }

  def reason_category_i18n
    I18n.t("activerecord.attributes.report.reason_categories.#{reason_category}")
  end
end
