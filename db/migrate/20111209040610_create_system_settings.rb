class CreateSystemSettings < ActiveRecord::Migration
  def change
    create_table :system_settings do |t|
      t.integer :event_id
      t.integer :min_time_diff
      t.integer :break_time

      t.timestamps
    end
  end
end
