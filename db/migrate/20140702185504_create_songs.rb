class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :vote
      t.string :song_name
    end
    add_index :songs, :vote
  end
end
