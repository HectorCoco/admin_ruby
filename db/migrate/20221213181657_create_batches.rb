class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.integer :price
      t.string :lot
      t.string :block
      t.text :boundaries
      t.string :state
      t.text :description

      t.timestamps
    end
  end
end
