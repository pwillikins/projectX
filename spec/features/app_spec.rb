require 'spec_helper'

feature 'User can see homepage' do
  scenario 'user visits homepage' do
    visit '/'

    expect(page).to have_content 'ProjectX'
    click_link 'Band Registration'
    expect(page).to have_content 'Band Registration'
    fill_in 'band_name', with: 'Dr Dog'
    fill_in 'tour_info', with: 'Summer Tour 2014'
    click_on 'Create Profile'
    expect(page).to have_content 'Dr Dog'
    expect(page).to have_content 'Summer Tour 2014'
  end
end