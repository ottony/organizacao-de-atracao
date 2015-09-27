require 'rails_helper'
include Features::ClearanceHelpers

feature 'Listing attraction' do

  context 'when not logged' do
    let!(:user) { create :user, :with_coming_attractions }
    let!(:user_without_nick) { create :user, :with_coming_attractions, nick_name: ''  }
    let!(:past_attraction) { create :attraction, :past }

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
      expect(page).to have_content I18n.l(Attraction.coming.first.day, :format => :short)
    end

    scenario 'show user nick_name with @' do
      expect(page).to have_content "@#{user.nick_name}"
    end
    
    scenario 'show email when user does not have nick_name' do
      expect(page).to have_content "#{user_without_nick.email}"
    end
  end

  context 'when logged' do
    let!(:coming_attractions) { create_list :attraction, 3, :coming }
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

    scenario 'show your attractions message' do
      expect(page).to have_content /suas atrações/i
    end
  end
end
