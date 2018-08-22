require "rails_helper"

feature "Login" do
  given(:registered_user) do
    FactoryBot.create(:user,
                      name: "Chaaartz",
                      level: 40,
                      trainer_phone_number: "9511234567",
                      password: "MyP@ssword1",
                      password_confirmation: "MyP@ssword1")
  end

  scenario "Logging with valid credentials" do
    visit "/login"
    fill_in "Trainer Name", with: registered_user.name
    fill_in "Password", with: "MyP@ssword1"

    click_on "Login"

    expect(page).to have_content "Welcome Back Trainer Chaaartz"
    expect(page).to have_link "Logout"
  end

  scenario "Try to login with unregistered name" do
    visit "/login"
    fill_in "Trainer Name", with: "SomeUnregisteredName"
    fill_in "Password", with: "MyP@ssword1"

    click_on "Login"

    expect(page).to have_content "Incorrect Trainer Name or Password, please try again."
  end
end
