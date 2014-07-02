class AddColumnToVotes < ActiveRecord::Migration
  def up
    remove_column :votes, :song_id
    add_column :votes, :song_name, :string
  end

  def down
    add_column :votes, :song_id, :string
    remove_column :votes, :song_name
  end
end
