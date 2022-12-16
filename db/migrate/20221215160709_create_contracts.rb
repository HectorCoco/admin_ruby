class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.integer :total_amount
      t.integer :total_payments
      t.text :comments
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
