require 'rails_helper'
include Features::ClearanceHelpers

feature 'User attractions' do
  let(:user) do
    create :user, :with_attractions

  end

  background { sign_in }

  scenario 'show titles' do
    visit attractions_user_path( user )

    user.attractions.coming.each do |attraction|
      expect(page).to have_content( attraction.title )
    end
  end

  scenario 'not show past attractions' do
    visit attractions_user_path( user )

    user.attractions.past.each do |attraction|
      expect(page).to_not have_content( attraction.title )
    end
  end
end
