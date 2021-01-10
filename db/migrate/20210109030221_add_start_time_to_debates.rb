class AddStartTimeToDebates < ActiveRecord::Migration[6.0]
  def change
    add_column :debates, :start_time, :datetime, null: false
  end
end
