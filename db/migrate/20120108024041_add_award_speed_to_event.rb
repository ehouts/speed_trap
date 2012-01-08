class AddAwardSpeedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :award_speed, :integer, :default => 999
    add_column :entrants, :past_award_speed, :boolean, :default => 0
  end
end
