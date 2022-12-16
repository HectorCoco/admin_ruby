class AddSquaremetersToBatch < ActiveRecord::Migration[7.0]
  def change
    add_column :batches, :square_meters, :string
  end
end
