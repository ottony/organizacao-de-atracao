require 'rails_helper'

feature 'Listing past attractions' do
  given(:user) { create :user, :with_attractions }
  given(:past_attraction)   { user.attractions.past.first }
  given(:coming_attraction) { user.attractions.coming.first }

  background { visit past_attractions_path( as: user ) }

  scenario 'show past attractions' do
    expect(page).to have_content past_attraction.title
  end

  scenario 'not show coming attractions' do
    expect(page).to_not have_content coming_attraction.title
  end
end
