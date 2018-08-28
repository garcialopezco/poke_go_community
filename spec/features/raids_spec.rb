require "rails_helper"

feature "Raids" do
  given(:chaaartz) do
    FactoryBot.create(:user,
                      name: "Chaaartz",
                      level: 40,
                      trainer_phone_number: "9511234567",
                      password: "MyP@ssword1",
                      password_confirmation: "MyP@ssword1")
  end

  given(:deux) do
    FactoryBot.create(:user,
                      name: "D3uxZ",
                      level: 40,
                      trainer_phone_number: "9511234567",
                      password: "MyP@ssword1",
                      password_confirmation: "MyP@ssword1")
  end

  given(:gym) do
    FactoryBot.create(:gym,
                      name: "Some Gym Name",
                      lat: "1.2345",
                      long: "0.7584",
                      description: "Test Gym")
  end

  scenario "Create a new raid" do
    given_a_gym_exists
    given_i_am_logged_in
    when_i_try_to_create_a_new_raid
    it_should_be_successful
    when_i_visit_raid_list_page
    i_should_see_one_confirmed
  end

  scenario "Confirm Raid attendee", js: true do
    given_a_gym_exists
    given_a_raid_is_scheduled
    given_i_am_logged_in
    when_i_confirm_my_assistance
    i_should_see_the_attendees_counter_increased
  end

  def given_i_am_logged_in
    visit "/login"
    fill_in "Trainer Name", with: chaaartz.name
    fill_in "Password", with: chaaartz.password

    click_on "Login"
  end

  def given_a_gym_exists
    gym
  end

  def given_a_raid_is_scheduled
    raid = FactoryBot.create :raid, gym: gym
    raid.attendees << deux
  end

  def when_i_try_to_create_a_new_raid
    visit "/raids/new" 

    select gym.name, from: "Gym"
    select "Machamp", from: "Boss"
    select "12", from: "Hour"
    select "34", from: "Minute"
    fill_in "Remaining Time", with: 40

    click_on "Create"
  end

  def when_i_visit_raid_list_page
    visit "/raids"
  end

  def when_i_confirm_my_assistance
    sleep(1)
    visit "/raids"

    within "div#raid-#{Raid.last.id}" do
      click_on "Confirm"
    end
  end

  def it_should_be_successful
    expect(page).to have_content "Raid was successfully created"
  end

  def i_should_see_one_confirmed
    within "div#raid-#{Raid.last.id}" do
      within ".raid-details" do
        expect(page).to have_content "Confirmed: 1"
      end
    end
  end

  def i_should_see_the_attendees_counter_increased
    within "div#raid-#{Raid.last.id}" do
      within ".raid-details" do
        expect(page).to have_content "Confirmed: 2"
      end
    end
  end
end
