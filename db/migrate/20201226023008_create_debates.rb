class CreateDebates < ActiveRecord::Migration[6.0]
  def change
    create_table :debates do |t|

      t.timestamps
    end
  end
end
