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

  describe 'POST create' do
    let(:attraction_args) do
      build( :attraction ).as_json( only: [:title, :media] )
    end

    subject { post :create, attraction: attraction_args }

    it 'redirect to attractions_path' do
      expect( subject ).to redirect_to( attractions_path )
    end

    it 'saves one attraction' do
      expect { subject }.to change(Attraction, :count).by 1
    end
  end
end
