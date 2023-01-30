class AddMonthlyPaymentToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :monthly_payment, :integer
  end
end
