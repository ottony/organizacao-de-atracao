class UserMailer < ActionMailer::Base
  default from: 'staf@dilek.com.br'

  def welcome_mail user
    @user = user
    @confirmation_link = confirmation_link( user )

    mail(to: user.email, subject: 'Confirmação de email')
  end

  private

  def confirmation_link user
    url_for(
      controller: 'users',
      action: 'confirm',
      id: user.id,
      token: user.confirmation_token
    )
  end
end
