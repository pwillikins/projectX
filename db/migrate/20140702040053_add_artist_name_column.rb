class AddArtistNameColumn < ActiveRecord::Migration
  def change
    add_column :votes, :artist_name, :string
  end

  def down
    remove_column :votes, :artist_name
  end
end
