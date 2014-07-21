require 'spec_helper'
require 'vcr'

feature "User can Vote" do
  scenario "user can search for gigs, vote for their corresponding songs and view them" do
    VCR.use_cassette('gig_finder/find_songs_for_artist') do
      register_user

      fill_in 'band_name', with: 'Dirty Heads'
      click_button 'Search For Gigs'
      expect(page).to have_content 'Dirty Heads Upcoming Shows Venue Location Cast Your Vote Total Votes'
      click_link 'Vote Now!', match: :first

      expect(page).to have_content 'Dirty Heads at Fingerprints Records (July 10, 2014)'
      check 'songs', match: :first
      click_button 'submit'

      expect(page).to have_content "Your votes have been submitted!"
      expect(page).to have_content "Dance all night (feat. matisyahu) 1"
    end
  end
end