class AddContractToBatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :batches, :contract, null: true, foreign_key: true
  end
end
