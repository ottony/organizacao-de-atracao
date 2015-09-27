class UserMailer < ActionMailer::Base
  DOMAIN = Rails.application.config.domain
  PORT = Rails.application.config.port

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
      token: user.confirmation_token,
      host: DOMAIN,
      port: PORT
    )
  end
end
