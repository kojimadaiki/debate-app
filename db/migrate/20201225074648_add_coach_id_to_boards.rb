class AddCoachIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :coach_id, :integer
  end
end
