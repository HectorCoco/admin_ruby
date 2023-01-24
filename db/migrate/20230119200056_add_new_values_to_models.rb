class AddNewValuesToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :next_payment, :date
    add_column :clients, :email, :string
    change_column :clients, :status, :boolean, default: true
  end
end
