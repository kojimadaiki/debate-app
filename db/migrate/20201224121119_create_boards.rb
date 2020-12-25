class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string      :title,       null: false
      t.datetime    :start_time,  null: false
      t.references  :coach,       foreign_key: true
      t.timestamps
    end
  end
end
