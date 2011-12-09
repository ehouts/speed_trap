class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :event_id
      t.string :name
      t.string :trap_1_name
      t.string :trap_2_name
      t.string :trap_3_name
      t.string :trap_4_name

      t.timestamps
    end
    add_index :stations, :event_id
      
  end
end
