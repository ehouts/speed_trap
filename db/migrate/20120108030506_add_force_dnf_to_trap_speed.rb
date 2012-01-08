class AddForceDnfToTrapSpeed < ActiveRecord::Migration
  def change
    add_column :trap_speeds, :force_dnf, :boolean, :default => false
  end
end
