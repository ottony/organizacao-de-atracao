require 'rails_helper'

feature 'User registration' do
  let(:nick_name) { 'OCTC' }

  scenario 'show nick_name' do
    visit sign_up_path

    within '#new_user' do
      fill_in 'user[nick_name]', with: nick_name
      fill_in 'user[email]'    , with: 'email@email.com'
      fill_in 'user[password]' , with: 'easy_password'

      find('input[type="submit"]').click
    end

    expect(page).to have_content nick_name
  end
end
