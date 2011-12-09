class CreateVehicleClasses < ActiveRecord::Migration
  def change
    create_table :vehicle_classes do |t|
      t.integer :event_id
      t.string :name
      t.integer :max_speed

      t.timestamps
    end
    add_index :vehicle_classes, :event_id
  end
end
