require 'rails_helper'

feature 'Listing attraction' do
  background do
    create_list :attraction, 5
    visit attractions_path
  end

  scenario 'show titles' do
    Attraction.all.each do |attraction|
      expect(page).to have_content attraction.title
    end
  end

  scenario 'show formated date' do
    expect(page).to have_content I18n.l(Attraction.last.day, :format => :short)
  end
end
