class RemoveAddressFromLocation < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :address, :string
  end
end
