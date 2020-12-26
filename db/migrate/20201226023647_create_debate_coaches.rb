class CreateDebateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :debate_coaches do |t|
      t.references :coach, foreign_key: true
      t.references :debate, foreign_key: true
      t.timestamps
    end
  end
end
