class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:edit, :update, :destroy]
  before_action :require_login, :except => :index

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction      = Attraction.new attraction_params
    @attraction.user = current_user

    return success_redirect if @attraction.save

    render :new
  end

  def edit
  end

  def update
    if @attraction.update_attributes( attraction_params )
      success_redirect
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy

    success_redirect
  end

  def index
    @attractions   = current_user.attractions.coming.includes(:user) if signed_in?
    @attractions ||= Attraction.coming.includes(:user)
  end

  private

  def set_attraction
    @attraction = Attraction.find params[:id]
  end

  def attraction_params
    params.require(:attraction).permit(
        :title, :media, :day, :description
    )
  end

  def success_redirect
    action = params[:action]
    title  = @attraction.try :title
    notice = I18n.t "attractions.messages.#{ action }.success", title: title, default: ''

    redirect_to attractions_path, notice: notice
  end
end
