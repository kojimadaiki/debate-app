class AddCoachIdToDebates < ActiveRecord::Migration[6.0]
  def change
    add_column :debates, :coach_id, :integer
  end
end
