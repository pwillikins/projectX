require 'spec_helper'

feature "User visits homepage" do
  scenario "user can search for gigs for a band" do
    VCR.use_cassette("gig_finder/find_events") do
      visit "/"

      fill_in "band_name", with: "Parliament Funkadelic"
      click_on "Search For Gigs"
      expect(page).to have_content @artist_name
      expect(page).to have_content @image_url
      expect(page).to have_content "The Forum", "London, UK"
      expect(page).to have_link "Rock Your Vote!"

      # user can click link and see list of songs
      click_link "Rock Your Vote!"
      expect(page).to have_content "The Forum", "London, UK"
      expect(page).to have_content "Bop Gun"
    end
  end
end