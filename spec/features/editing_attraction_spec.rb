require 'rails_helper'
include Features::ClearanceHelpers

feature 'Editing attraction' do
  given(:empty_attraction) { build( :attraction, :empty ) }
  given(:attraction)       { create( :attraction ) }

  background do
    sign_in
    visit edit_attraction_path( attraction )
  end

  scenario 'load attraction title' do
    expect(page).to have_selector("input[value='#{ attraction.title }']")
  end

  scenario 'load attraction media' do
    expect(page).to have_selector("input[value='#{ attraction.media }']")
  end

  scenario 'show success' do
    within "#edit_attraction_#{attraction.id}" do
      fill_in 'attraction[title]' , with: 'New Title'

      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t( 'attractions.messages.update.success' )
  end
end
