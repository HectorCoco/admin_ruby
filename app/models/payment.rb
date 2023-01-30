class Payment < ApplicationRecord
  belongs_to :contract

  validates :date, :file_number, :kind, :amount, presence: true

  scope :order_by_date, -> { order(date: :desc) }
  scope :order_by_file_number, -> { order(file_number: :desc) }

  after_create :update_date
  after_destroy :subtract_next_payment

  def update_date
    if kind == "Completo" && file_number >= contract.payments.max_by { |p| p[:file_number] }.file_number
      current_date = contract.next_payment
      current_date += 1.month
      contract.update(next_payment: current_date)
    end
  end

  def subtract_next_payment
    if kind == "Completo" && file_number == contract.payments.max_by { |p| p[:file_number] }.file_number
      current_date = contract.next_payment
      current_date -= 1.month
      contract.update(next_payment: current_date)
    end
  rescue => exception
    current_date = contract.first_payment
    contract.update(next_payment: current_date)
  end
end
