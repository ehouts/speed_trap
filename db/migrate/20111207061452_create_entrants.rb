class CreateEntrants < ActiveRecord::Migration
  def change
    create_table :entrants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :number
      t.integer :vehicle_class_id
      t.string :vehicle_make
      t.string :vehicle_model
      t.string :vehicle_color
      t.integer :event_id

      t.timestamps
    end
    add_index :entrants, :event_id
    add_index :entrants, [:event_id, :vehicle_class_id]
      
  end
end
