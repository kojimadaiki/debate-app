class CreateDebateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :debate_users do |t|
      t.references :user, foreign_key: true
      t.references :debate, foreign_key: true
      t.timestamps
    end
  end
end
