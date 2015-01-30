class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :caption
      t.integer :board_id

      t.timestamps
    end
    add_index :topics, [:board_id, :updated_at]
  end
end
