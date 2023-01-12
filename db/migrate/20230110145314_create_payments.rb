class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.date :date
      t.string :file_number
      t.string :kind
      t.float :amount
      t.text :comments
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
