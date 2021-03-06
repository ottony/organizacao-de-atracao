require 'rails_helper'
include Features::AttractionsHelpers

feature 'Creating attraction' do
  given(:attraction_title) { 'A Lagoa Azul' }
  given(:empty_attraction) { build( :attraction, :empty ) }
  given(:user) { create( :user ) }

  background do
    visit new_attraction_path( as: user )
  end

  scenario 'show success' do
    within '#new_attraction' do
      fill_in 'attraction[title]' , with: attraction_title
      fill_in 'attraction[media]' , with: 'Television'
      select_datetime Time.now    , from: 'attraction_day'

      find('input[type="submit"]').click
    end

    expected_content = I18n.t 'attractions.messages.create.success', title: attraction_title

    expect( page ).to have_content( expected_content )
  end

  scenario 'show errors' do
    within '#new_attraction' do
      fill_in 'attraction[title]' , with: ''
      fill_in 'attraction[media]' , with: ''

      find('input[type="submit"]').click
    end

    empty_attraction.valid?

    empty_attraction.errors.full_messages.each do |error|
      expect(page).to have_content(error)
    end
  end
end
