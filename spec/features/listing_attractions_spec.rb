require 'rails_helper'
include Features::ClearanceHelpers

feature 'Listing attraction' do
  let!(:past_attraction) { create :attraction, :past }
  let!(:coming_attractions) { create_list :attraction, 3, :coming }

  context 'when not logged' do
    background { visit attractions_path }

    scenario 'show titles of coming attractions' do
      Attraction.coming.each do |attraction|
        expect(page).to have_content attraction.title
      end
    end

    scenario 'not show titles of past attractions' do
      expect(page).to_not have_content past_attraction.title
    end

    scenario 'show formated date' do
      expect(page).to have_content I18n.l(coming_attractions.first.day, :format => :short)
    end
  end

  context 'when logged' do
    let(:user) { create :user, :with_coming_attractions }

    background do
      sign_in_as user, user.password

      visit attractions_path
    end

    scenario 'show my attractions' do
      user.attractions.coming.each do |attraction|
        expect(page).to have_content attraction.title
      end
    end

    scenario 'do not show attraction that are not mine' do
      coming_attractions.each do |attraction|
        expect(page).to_not have_content attraction.title
      end
    end
  end
end
