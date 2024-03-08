class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.string :location
      t.float :temperature
      t.integer :humidity
      t.string :precipitation
      t.float :wind_speed

      t.timestamps
    end
  end
end
