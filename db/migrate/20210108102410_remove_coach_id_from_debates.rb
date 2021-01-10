class RemoveCoachIdFromDebates < ActiveRecord::Migration[6.0]
  def change
    remove_column :debates, :coach_id, :integer
  end
end
