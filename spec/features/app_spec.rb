require 'spec_helper'

feature "User visits homepage" do
  scenario "user can search for Artists" do
    visit "/"

    expect(page).to have_content "ProjectX"

    fill_in "search_term", with: "Dr Dog"
    click_on "Search"
    expect(page).to have_content "How Long Must I Wait"
  end
end