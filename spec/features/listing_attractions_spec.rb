require 'rails_helper'

feature 'Listing attraction' do
  let(:past_attraction) { create :attraction, :past }
  let(:coming_attractions) { create_list :attraction, 3, :coming }

  background do
    coming_attractions
    past_attraction

    visit attractions_path
  end

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
