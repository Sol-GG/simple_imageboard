class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :tag
      t.string :long_name

      t.timestamps
    end
  end
end
