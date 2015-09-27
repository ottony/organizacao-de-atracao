require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user, :unconfirmed) }

  it 'send confirmation email when create' do
    expect {create(:user)}.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'set confirmation_token after create' do
    expect(user.confirmation_token).to_not be_nil
  end

  it 'set confirmed_at after confirmation' do
    user.confirm user.confirmation_token

    expect(user.confirmed_at).to_not be_nil
  end

  it 'not set confirmed_at if token not match' do
    user.confirm 'invalid_token'

    expect(user.confirmed_at).to be_nil
  end
end
