require 'rails_helper'

RSpec.describe UserMailer do
  let(:user) { create :user, :unconfirmed }

  context 'welcome email' do
    subject    { UserMailer.welcome_mail user }

    it 'contains confirmation token' do
      expect( subject.body ).to match user.confirmation_token
    end

    it 'contains user nick_name' do
      expect( subject.body ).to match user.nick_name
    end

    it 'It is delivered correctly' do
      expect( subject.to ).to eq [user.email]
    end
  end
end

