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

  context 'scope' do
    let(:coming_attractions) { create_list :attraction, 5, :coming }
    let(:past_attractions)   { create_list :attraction, 5, :past }

    before do
      coming_attractions
      past_attractions
    end

    it 'coming attractions' do
      expect( Attraction.coming ).to match_array( coming_attractions )
    end

    it 'past attractions' do
      expect( Attraction.past ).to match_array( past_attractions )
    end

    it 'order by day' do
      expected_coming = Attraction.where(id: coming_attractions).order(:day)

      expect( Attraction.coming.map(&:id) ).to eq( expected_coming.map(&:id) )
    end
  end
end
