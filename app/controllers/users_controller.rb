class UsersController < Clearance::UsersController
  def index
    @users = User.all.includes(:attractions)
  end

  private

  def user_from_params
    User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :password, :nick_name)
  end
end
