require 'spec_helper'

describe Vote do
  it "can find gigs voted for by artist" do
    vote = Vote.create!(artist_name: "311", song_name: "Down", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    expect(vote.find_gigs("311")).to include("311 at The Fillmore Auditorium (August 5, 2014)" => 1234567)
  end

  it "can find songs voted for by gig id" do
    vote = Vote.create!(artist_name: "311", song_name: "Down", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    expect(vote.find_songs(1234567)).to include(["Down", 1])
  end
end