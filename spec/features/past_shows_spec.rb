require 'spec_helper'

feature "Past Shows" do
  scenario "user can view votes for past shows" do
    register_user
    Vote.create!(artist_name: "311", song_name: "Down", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    Vote.create!(artist_name: "311", song_name: "Down", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    Vote.create!(artist_name: "311", song_name: "Beautiful disaster", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    Vote.create!(artist_name: "311", song_name: "Prisoner", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    Vote.create!(artist_name: "311", song_name: "Creatures", gig_id: 1234567, gig_display_name: "311 at The Fillmore Auditorium (August 5, 2014)")
    fill_in "band_name", with: "311"
    click_button "Search for Concerts"
    click_on "Past Votes"
    expect(page).to have_content("311 at The Fillmore Auditorium (August 5, 2014)")

    click_on "311 at The Fillmore Auditorium (August 5, 2014)"
    expect(page).to have_content("Beautiful disaster")
    expect(page).to have_content("Down")
    expect(page).to have_content("Prisoner")
    expect(page).to have_content("Creatures")
  end
end