class CreateBusStops < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_stops do |t|
      t.string :code
      t.string :location
      t.string :name

      t.timestamps
    end
  end
end
