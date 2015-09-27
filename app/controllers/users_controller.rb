class UsersController < Clearance::UsersController
  before_action :set_user, :only => [:attractions, :confirm]

  def index
    @users = User.all.includes(:attractions)
  end

  def attractions
    @attractions = @user.attractions.coming
  end

  def confirm
    @user.confirm params[:token]

    message   = I18n.t('flashes.success_after_confirm') if @user.confirmed?
    message ||= I18n.t('flashes.failure_after_confirm')

    redirect_to sign_in_path, notice: message
  end

  private

  def url_after_create
    flash[:notice] = I18n.t('flashes.success_after_create')

    attractions_path
  end

  def user_from_params
    User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :password, :nick_name)
  end

  def set_user
    @user = User.find params[:id]
  end
end
