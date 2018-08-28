require "rails_helper"

feature "Signing up" do
  scenario "Signing up a new user" do
    visit "/sign_up"
    fill_in "Trainer Name", with: "Chaaartz"
    fill_in "Level", with: "38"
    select  "Instinct", from: "user_team"
    fill_in "Phone Number", with: "95112334567"
    fill_in "Password", with: "MyP@ssword1"
    fill_in "Password Confirmation", with: "MyP@ssword1"

    click_on "Sign Up"

    expect(page).to have_content "Welcome to the Community Trainer Chaaartz"
    expect(page).to have_link "Logout"
  end
end
