require 'spec_helper'

feature "User visits homepage" do
  scenario "user can search for gigs for a band" do
    VCR.use_cassette("gig_finder/find_events") do
      visit "/"

      fill_in "band_name", with: "Dr Dog"
      click_on "Search For Gigs"
      expect(page).to have_content @artist_name
      expect(page).to have_content @image_url
      expect(page).to have_content "Hot August Music Festival", "Cockeysville, MD, US"
    end
  end
end