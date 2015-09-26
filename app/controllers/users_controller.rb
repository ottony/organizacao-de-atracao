class UsersController < Clearance::UsersController
  before_action :set_user, :only => :attractions

  def index
    @users = User.all.includes(:attractions)
  end

  def attractions
    @attractions = @user.attractions.coming
  end

  private

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
