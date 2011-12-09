class CreateTrapSpeeds < ActiveRecord::Migration
  def change
    create_table :trap_speeds do |t|
      t.integer :event_id
      t.integer :station_id
      t.integer :entrant_id
      t.time :capture_time
      t.boolean :official_flag
      t.integer :trap_number

      t.timestamps
    end
    add_index :trap_speeds, :event_id
    add_index :trap_speeds, [:event_id, :station_id, :entrant_id]
  end
end
