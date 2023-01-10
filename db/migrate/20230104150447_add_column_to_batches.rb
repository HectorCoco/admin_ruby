class AddColumnToBatches < ActiveRecord::Migration[7.0]
  def change
    add_column :batches, :uuid, :string
    add_column :contracts, :down_payment, :integer

    change_column :batches, :state, :string, default: "1"
  end
end
