require "rails_helper"

feature "Logout" do
  given(:registered_user) do
    FactoryBot.create(:user,
                      name: "Chaaartz",
                      level: 40,
                      trainer_phone_number: "9511234567",
                      password: "MyP@ssword1",
                      password_confirmation: "MyP@ssword1")
  end


  background do
    visit "/login"
    fill_in "Trainer Name", with: registered_user.name
    fill_in "Password", with: "MyP@ssword1"

    click_on "Login"
  end

  scenario "Logging out" do
    visit "/"

    click_on "Logout"

    expect(page).to have_content "Your session was closed correctly."
    expect(page).to have_link "Login"
    expect(page).to have_link "Sign Up"
  end
end
