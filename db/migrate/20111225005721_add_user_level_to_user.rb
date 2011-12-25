class AddUserLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_level, :integer, :default => 99
  end
end
