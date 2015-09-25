require 'rails_helper'

feature 'Listing attraction' do
  background do
    create_list :attraction, 5
  end
end
