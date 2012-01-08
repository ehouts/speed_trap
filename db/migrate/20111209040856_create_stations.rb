class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :event_id
      t.string :name
      t.string :station_code
      t.string :trap_1_name
      t.string :trapid_1
      t.string :trap_2_name
      t.string :trapid_2
      t.string :trap_3_name
      t.string :trapid_3
      t.string :trap_4_name
      t.string :trapid_4

      t.timestamps
    end
    add_index :stations, :event_id
      
  end
end
