class Payment < ApplicationRecord
  belongs_to :contract

  validates :date, :file_number, :kind, :amount, :realization_date, presence: true

  scope :order_by_date, -> { order(date: :desc) }
  scope :order_by_realization_date, -> { order(realization_date: :desc) }
  scope :order_by_file_number, -> { order("file_number::integer asc") }
  scope :order_by_file_number_desc, -> { order("file_number::integer desc") }

  after_create :update_date
  before_destroy :subtract_next_payment

  def update_date
    if kind == "Completo" && file_number >= contract.payments.order_by_file_number.last.file_number
      current_date = contract.next_payment
      current_date += 1.month
      contract.update(next_payment: current_date)
    end
  end

  def subtract_next_payment
    if kind == "Completo" && file_number == contract.payments.order_by_file_number.last.file_number

      current_date = contract.next_payment
      current_date -= 1.month
      contract.update(next_payment: current_date)
    end
    # rescue => exception
    #   current_date = contract.first_payment
    #   contract.update(next_payment: current_date)
  end
end
