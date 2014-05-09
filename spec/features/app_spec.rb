require 'spec_helper'

feature "User visits homepage" do
  scenario "user can search for gigs for a band" do
    visit "/"

    fill_in "band_name", with: "Dr Dog"
    click_on "Search For Gigs"
    expect(page).to have_content "Mulberry Mountain Lodging and Events",
                                 "Cain's Ballroom",
                                 "The Blue Note",
                                 "The Vogue Theatre",
                                 "Stage AE",
                                 "Cat's Cradle",
                                 "Manchester Farm",
                                 "Unknown venue",
                                 "Western Gateway Park",
                                 "Gorge Amphitheatre",
                                 "Winston's Farm",
                                 "Hot August Music Festival"
  end
end