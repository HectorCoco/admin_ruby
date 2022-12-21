class Contract < ApplicationRecord
  belongs_to :client
  has_many :batches

  attr_accessor :batches_selected
  # attr_accessor :batch_list

  validates_numericality_of :total_amount, :total_payments, greater_than: 0

  # Callbacks
  before_destroy :reset_contract
  after_save :update_contract_in_batch

  def update_contract_in_batch
    Batch.batch_contract_update(batches_selected, id)
  end

  def reset_contract
    Batch.reset_contract_id_in_batches(id)
  end
end
