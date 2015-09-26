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
end
