require 'rails_helper'

RSpec.describe Attraction do
  context 'validates presence of title and media' do
    it 'has to be valid' do
      expect( build :attraction ).to be_valid
    end

    it 'has to be invalid' do
      expect( build :attraction, :empty ).to be_invalid
    end
  end
end
