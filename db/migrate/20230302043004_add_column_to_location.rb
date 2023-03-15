class AddColumnToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :stage, :integer
    add_column :locations, :ink_name, :string
  end
end
