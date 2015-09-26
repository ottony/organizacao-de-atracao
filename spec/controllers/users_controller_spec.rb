require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET index' do
    it 'assigns users' do
      get :index
      expect( assigns :users ).to be_kind_of ActiveRecord::Relation
    end
  end
end
