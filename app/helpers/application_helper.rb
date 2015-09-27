module ApplicationHelper
  def session_link
    return link_to('Entrar', sign_in_path) unless signed_in?
    
    link_to( "Olá #{current_user.nick_name}, Sair", sign_out_path, :method => :delete )
  end

  def sign_up_link
    link_to t('helpers.submit.user.create'), sign_up_path unless signed_in?
  end

  def alert_class type
    type_class = {
      'success' => 'alert-success',
      'error'   => 'alert-error',
      'alert'   => 'alert-block',
      'notice'  => 'alert-info'
    }[type.to_s]

    type_class ||= type.to_s
    "alert #{type_class}"
  end
end
