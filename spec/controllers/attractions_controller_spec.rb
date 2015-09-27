require 'rails_helper'

RSpec.describe AttractionsController do
  context 'not logged' do
    describe 'GET index' do
      it 'returns success' do
        expect( get( :index ) ).to have_http_status(:success)
      end
    end

    describe 'GET new' do
      it 'redirect to sign_in_path' do
        expect( get( :new ) ).to redirect_to( sign_in_path )
      end
    end
  end

  context 'logged' do
    let(:user) { create :user, :with_attractions }
    let(:attraction) { user.attractions.first }

    before { sign_in_as user }

    describe 'GET new' do
      it 'assigns @attraction' do
        get :new
        expect( assigns :attraction ).to be_kind_of Attraction
      end
    end

    describe 'POST create' do

      subject { post :create, attraction: attributes_for(:attraction) }

      it 'redirect to attractions_path' do
        expect( subject ).to redirect_to( attractions_path )
      end

      it 'saves one attraction' do
        expect { subject }.to change(Attraction, :count).by 1
      end

      it 'associate attraction to logged user' do
        subject
        expect( Attraction.last.user ).to eq( User.last )
      end
    end

    describe 'GET edit' do
      before { get :edit, id: attraction.id }

      it 'assigns @attraction' do
        expect( assigns :attraction ).to eq attraction
      end
    end

    describe 'PUT update' do
      subject do
        put :update, id: attraction.id, attraction: { title: 'new title' }
      end

      it 'updates attraction' do
        expect { subject }.to change{ Attraction.first.title }
      end

      it 'redirect to attractions_path' do
        expect( subject ).to redirect_to( attractions_path )
      end
    end

    describe 'DELETE destroy' do
      subject do
        delete :destroy, id: user.attractions.last.id
      end

      it 'redirect to attractions_path' do
        expect( subject ).to redirect_to( attractions_path )
      end

      it 'removes attraction' do
        expect { subject }.to change{ Attraction.count }.by(-1)
      end
    end

    describe 'GET index' do
      it 'assigns @attractions' do
        get :index
        expect( assigns :attractions ).to be_kind_of ActiveRecord::Relation
      end
    end

    describe 'GET past_attraction' do
      it 'assigns @attractions' do
        get :past
        expect( assigns( :attractions ) ).to be_kind_of ActiveRecord::Relation
      end
    end
  end
end
