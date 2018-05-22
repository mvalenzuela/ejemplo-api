class CreateBusEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_events do |t|
      t.string :plate_code
      t.integer :speed

      t.timestamps
    end
  end
end
