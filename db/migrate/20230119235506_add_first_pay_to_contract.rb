class AddFirstPayToContract < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :first_payment, :date
  end
end
