class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :block
      t.string :lot
      t.string :colony
      t.string :postal_code
      t.string :city
      t.string :state
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
