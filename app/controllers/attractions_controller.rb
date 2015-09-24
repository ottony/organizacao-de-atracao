class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end
end
