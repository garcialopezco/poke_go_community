require "rails_helper"

feature "Raids" do
  given(:registered_user) do
    FactoryBot.create(:user,
                      name: "Chaaartz",
                      level: 40,
                      trainer_phone_number: "9511234567",
                      password: "MyP@ssword1",
                      password_confirmation: "MyP@ssword1")
  end

  given(:gym) do
    FactoryBot.create(:gym, name: "Some Gym Name", lat: "1.2345", long: "0.7584", description: "Test Gym")
  end

  scenario "Create a new raid" do
    given_i_am_logged_in
    given_a_gym_exists
    when_i_try_to_create_a_new_raid
    it_should_be_successful
  end

  def given_i_am_logged_in
    visit "/login"
    fill_in "Trainer Name", with: registered_user.name
    fill_in "Password", with: registered_user.password

    click_on "Login"
  end

  def given_a_gym_exists
    gym
  end

  def when_i_try_to_create_a_new_raid
    visit "/raids/new" 

    # save_and_open_page

    select gym.name, from: "Gym"
    select "Machamp", from: "Boss"
    select "12", from: "Hour"
    select "34", from: "Minute"
    fill_in "Remaining Time", with: 40

    click_on "Create"
  end

  def it_should_be_successful
    expect(page).to have_content "Raid was successfully created"
  end
end
