require 'rails_helper'

RSpec.describe AttractionsController do
  let(:attraction) { create :attraction }

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

  describe 'GET edit' do
    before { get :edit, id: attraction.id }

    it 'returns success' do
      expect( response ).to have_http_status(:success)
    end

    it 'assigns @attraction' do
      expect( assigns :attraction ).to eq attraction
    end
  end

  describe 'PUT update' do
    subject do
      put :update, id: attraction.id, attraction: { title: 'new title' }
    end

    it 'updates attraction' do
      attraction

      expect { subject }.to change{ Attraction.first.title }
    end

    it 'redirect to attractions_path' do
      expect( subject ).to redirect_to( attractions_path )
    end
  end

  describe 'DELETE destroy' do
    before { create_list :attraction, 3 }

    subject do
      delete :destroy, id: Attraction.last.id
    end

    it 'redirect to attractions_path' do
      expect( subject ).to redirect_to( attractions_path )
    end

    it 'removes attraction' do
      expect { subject }.to change{ Attraction.count }.by(-1)
    end

  end
end