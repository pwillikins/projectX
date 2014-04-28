require 'spec_helper'

feature 'User visits homepage' do
  scenario 'user can register and edit profile' do
    visit '/'

    expect(page).to have_content 'ProjectX'
    click_link 'Band Registration'
    expect(page).to have_content 'Band Registration'
    fill_in 'band_name', with: 'Dr Dog'
    fill_in 'tour_info', with: 'Summer Tour 2014'
    click_on 'Create Profile'
    expect(page).to have_content 'Dr Dog'
    expect(page).to have_content 'Summer Tour 2014'

    click_link 'Edit'
    fill_in 'band_name', with: 'fbs'
    fill_in 'tour_info', with: 'summer'
    click_on 'Update'
    expect(page).to have_content 'fbs'
    expect(page).to have_content 'summer'
  end
end