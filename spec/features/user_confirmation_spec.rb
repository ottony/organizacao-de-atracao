require 'rails_helper'
include Features::AttractionsHelpers

feature 'Confirme user' do
  given!(:user) { create :user, :unconfirmed }

  scenario 'show sucess' do
    visit confirm_user_path( id: user.id, token: user.confirmation_token )

    expect(page).to have_content I18n.t('flashes.success_after_confirm')
  end

  scenario 'show invalid token' do
    visit confirm_user_path( id: user.id, token: 'invalid token' )

    expect(page).to have_content I18n.t('flashes.failure_after_confirm')
  end
end
