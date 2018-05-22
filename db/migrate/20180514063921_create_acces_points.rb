class CreateAccesPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :acces_points do |t|
      t.references :bus_stop, foreign_key: true
      t.string :mac
      t.string :ip
      t.string :status
      t.date :last_message

      t.timestamps
    end
  end
end
