class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:edit, :update, :delete]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new attraction_params

    if @attraction.save
      redirect_to attractions_path, notice: success_notice( @attraction )
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update_attributes( attraction_params )
      redirect_to attractions_path, notice: success_notice( @attraction )
    else
      render :edit
    end
  end

  private

  def set_attraction
    @attraction = Attraction.find params[:id]
  end

  def attraction_params
    params.require(:attraction).permit(
        :title, :media
    )
  end

  def success_notice attraction
    action = params[:action]

    I18n.t "attractions.messages.#{ action }.success", title: attraction.title
  end
end
