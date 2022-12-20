class Batch < ApplicationRecord
  belongs_to :contract, optional: true

  scope :allowed, -> { where("state=1") }

  # @batches.where("contract_id==@contract.id")
  # @contract.batches_params
end
