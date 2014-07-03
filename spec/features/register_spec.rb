require 'spec_helper'

feature "User visits homepage" do
  scenario "user can register a new account and logout" do
    register_user

    expect(page).to have_button 'Search for Concerts'
    expect(page).to have_content 'example@email.com'
    expect(page).to have_link 'Logout'
    click_link 'Logout'
  end

  scenario "email cannot be blank when trying to register" do
    register_user(:email => '         ')
    expect(page).to have_content "must be a valid email address"
  end

  scenario "password cannot be blank when trying to register" do
    register_user(:password => '       ')
    expect(page).to have_content "Password can't be blank"
  end

  scenario "guest cannot register if password field does not match password confirmation field" do
    register_user(:password => 'coolcool')
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "guest cannot register if password is less than 8 chars" do
    register_user(:password => 'skate14', :password_confirmation => 'skate14')
    expect(page).to have_content "Password must be 8 or more characters"
  end

  scenario "guest cannot register with an email that has been registered before" do
    user = create_user
    register_user(:email => user.email)
    expect(page).to have_content "Email has already been taken"
  end

  scenario "guest cannot register if email is not valid" do
    register_user(:email => 'example')
    expect(page).to have_content "must be a valid email address"
  end
end