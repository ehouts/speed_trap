class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :name
      t.integer :user_level

      t.timestamps
    end
  end
end
