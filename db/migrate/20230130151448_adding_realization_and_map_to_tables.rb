class AddingRealizationAndMapToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :realization_date, :date
    add_column :contracts, :map, :boolean, default: false
    add_column :contracts, :map_date, :date
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
  end
end
