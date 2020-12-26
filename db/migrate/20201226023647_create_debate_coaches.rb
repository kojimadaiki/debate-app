class CreateDebateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :debate_coaches do |t|

      t.timestamps
    end
  end
end
