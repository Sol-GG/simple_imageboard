class AddIndexToBoardsTag < ActiveRecord::Migration
  def change
  	add_index :boards, :tag, unique: true
  end
end
