class Payment < ApplicationRecord
  belongs_to :contract

  scope :order_by_date, -> { order(date: :desc) }
end
