require 'spec_helper'

feature "User can see homepage" do
  scenario "user visits homepage" do
    visit "/"

    expect(page).to have_content("Rock Your Vote!")
  end
end