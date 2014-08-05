class AddGigDisplayNameColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :gig_display_name, :string
  end
end
