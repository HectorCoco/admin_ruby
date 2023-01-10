class Batch < ApplicationRecord
  belongs_to :contract, optional: true

  validates :price, :lot, :block, :state, presence: true

  scope :allowed, -> { where("state=1") }
  scope :related, ->(param_contract_id) { where("contract_id = ?", param_contract_id) }
  scope :order_by_free, -> { order(state: :asc) }

  # @batches.where("contract_id==@contract.id")
  # @contract.batches_params
  def self.batch_contract_update(batches_selected, param_contract_id)
    where(id: batches_selected).update(contract_id: param_contract_id, state: "2")
  end

  def self.reset_contract_id_in_batches(param_contract_id)
    where(contract_id: param_contract_id).update_all(contract_id: nil, state: "1")
  end
end
