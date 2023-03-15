class CreateInks < ActiveRecord::Migration[6.1]
  def change
    create_table :inks do |t|
      t.string :name
      t.string :color_type

      t.timestamps
    end
  end
end
