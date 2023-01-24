class Payment < ApplicationRecord
  belongs_to :contract

  scope :order_by_date, -> { order(date: :desc) }

  after_create :update_date

  def update_date
    current_date = if contract.next_payment.nil?
      contract.first_payment
    else
      contract.next_payment
    end
    current_date += 1.month
    contract.update(next_payment: current_date)
  end
end
