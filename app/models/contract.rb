class Contract < ApplicationRecord
  belongs_to :client
  has_many :batches
  has_many :payments, dependent: :destroy

  attr_accessor :batches_selected
  # attr_accessor :batch_list

  validates_numericality_of :total_amount, :down_payment, :total_payments, :monthly_payment, greater_than: 0
  validates :total_amount, :total_payments, :down_payment, :first_payment, :monthly_payment, :signing_date, presence: true

  scope :order_by_date, -> { order(created_at: :asc) }
  scope :expired, -> { where("next_payment<=?", Date.current) }
  scope :order_by_expired, -> { order(next_payment: :asc) }
  scope :order_by_next, -> { order(next_payment: :asc) }

  # Callbacks
  before_destroy :reset_contract_in_batch
  # after_save :update_contract_in_batch, if: :changes_next_payment?

  def update_contract_in_batch
    Batch.reset_contract_id_in_batches(id)
    Batch.batch_contract_update(batches_selected, id)
  end

  def reset_contract_in_batch
    Batch.reset_contract_id_in_batches(id)
  end

  def changes_next_payment?
    # binding.prailsry
    !next_payment_changed?
  end

  def set_first_next_payment
    current_date = first_payment
    update_column(:next_payment, current_date)
  end

  def self.get_notifications
    self
    .joins("JOIN payments ON payments.contract_id = contracts.id")
    .expired
    .group(:id)
    .having("SUM(payments.amount) + contracts.down_payment != contracts.total_amount")
    .order_by_next
  end
end
