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

      t.timestamps
    end
  end
end
