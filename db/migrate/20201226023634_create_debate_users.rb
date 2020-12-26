class CreateDebateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :debate_users do |t|

      t.timestamps
    end
  end
end
