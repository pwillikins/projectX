require 'spec_helper'
require 'vcr'

feature "User can Vote" do
  scenario "user can search for gigs, vote for their corresponding songs and view them" do
    VCR.use_cassette('gig_finder/find_events') do
      register_user

      fill_in 'band_name', with: 'Parliament Funkadelic'
      click_button 'Search For Gigs'
      expect(page).to have_content 'The Forum', 'London, UK'
      click_link 'Vote Now!', match: :first

      expect(page).to have_content 'The Forum'
      check 'songs', match: :first
      click_button 'submit'

      expect(page).to have_content "Your votes have been submitted!"
      click_link 'My Votes'
      expect(page).to have_content "Gettin' It"
    end
  end

  scenario "user can view all votes for single gig" do
    VCR.use_cassette('gig_finder/find_events') do
      register_user

      fill_in 'band_name', with: 'Parliament Funkadelic'
      click_button 'Search For Gigs'
      expect(page).to have_content 'The Forum', 'London, UK'
      click_link 'See All Votes For This Concert', match: :first
      expect(page).to have_content "Voted List"
    end
  end
end