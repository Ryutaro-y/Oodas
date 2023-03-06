class ChangeStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :location_id
    add_column :stocks, :location_name, :string
  end
end
