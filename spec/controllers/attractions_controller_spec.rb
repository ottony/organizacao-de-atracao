require 'rails_helper'

RSpec.describe AttractionsController do
  describe 'GET new' do
    before { get :new }

    it 'returns success' do
      expect( response ).to have_http_status(:success)
    end

    it 'assigns @attraction' do
      expect( assigns :attraction ).to be_kind_of Attraction
    end
  end
end
