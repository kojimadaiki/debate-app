class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string      :name
      t.string      :title,       null: false
      t.datetime    :start_time,  null: false
      t.timestamps
    end
  end
end
