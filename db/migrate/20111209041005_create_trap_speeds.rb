class CreateTrapSpeeds < ActiveRecord::Migration
  def change
    create_table :trap_speeds do |t|
      t.integer :event_id
      t.integer :station_id
      t.integer :entrant_id
      t.integer :trapid # the sensor id of the trap
      t.integer :trap_num # the trap # in the station
      t.decimal :capture_time, :precision => 16, :scale => 0
      t.boolean :official_flag
      t.boolean :dup_flag
      t.boolean :invalid_flag
      t.decimal :speed, :precision => 16, :scale => 5

      t.timestamps
    end
    add_index :trap_speeds, :event_id
    add_index :trap_speeds, [:event_id, :station_id, :entrant_id]
  end
end
