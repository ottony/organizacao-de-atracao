require 'rails_helper'

feature 'User attractions' do
  let(:user) { create :user, :with_attractions }

  scenario 'show titles' do
    visit attractions_user_path( user, as: create(:user) )

    user.attractions.coming.each do |attraction|
      expect(page).to have_content( attraction.title )
    end
  end

  scenario 'not show past attractions' do
    visit attractions_user_path( user, as: create(:user) )

    user.attractions.past.each do |attraction|
      expect(page).to_not have_content( attraction.title )
    end
  end
end
