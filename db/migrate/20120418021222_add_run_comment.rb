class AddRunComment < ActiveRecord::Migration
  def change
    add_column :trap_speeds, :comment, :string
  end

end
