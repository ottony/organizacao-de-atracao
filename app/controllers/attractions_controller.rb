class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new attraction_params

    if @attraction.save
      redirect_to attractions_path, notice: success_created( @attraction )
    else
      render :new
    end
  end

  def index
  end

  private

  def attraction_params
    params.require(:attraction).permit(
        :title, :media
    )
  end

  def success_created attraction
    I18n.t('attractions.registrations.success', title: attraction.title)
  end
end
