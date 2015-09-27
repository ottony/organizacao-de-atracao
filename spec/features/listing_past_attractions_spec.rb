require 'rails_helper'
include Features::ClearanceHelpers

feature 'Listing past attractions' do
  let(:user) do
    create :user, :with_attractions
  end

  let(:past_attraction)   { user.attractions.past.first }
  let(:coming_attraction) { user.attractions.coming.first }

  background do
    sign_in_as user, user.password

    visit past_attractions_path
  end

  scenario 'show past attractions' do
    expect(page).to have_content past_attraction.title
  end

  scenario 'not show coming attractions' do
    expect(page).to_not have_content coming_attraction.title
  end
end
