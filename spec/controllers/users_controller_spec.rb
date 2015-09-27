require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET index' do
    it 'assigns users' do
      get :index
      expect( assigns :users ).to be_kind_of ActiveRecord::Relation
    end
  end

  describe 'GET attractions' do
    let(:user) { create :user, :with_coming_attractions }
    let(:user_attractions_ids) { user.attractions.map(&:id) }

    it 'assigns @attractions' do
      create_list :attraction, 3

      get :attractions, id: user.id
      expect( assigns(:attractions).map(&:id) ).to match_array( user_attractions_ids )
    end
  end

  describe 'GET confirm' do
    let(:user) { create :user, :unconfirmed }
    before { get :confirm, id: user.id, token: user.confirmation_token }

    it 'confirm user' do
      expect(User.last.confirmed?).to eq true
    end

    it 'redirect to sign_in_path' do
      expect(response).to redirect_to( sign_in_path )
    end
  end
end
