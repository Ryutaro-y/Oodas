class AddStageToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :stage, :integer
  end
end
