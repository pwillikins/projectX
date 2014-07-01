class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :gig_id
    end
  end
end
