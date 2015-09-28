module ApplicationHelper
  def brand_link args = {}
    link_text   = 'Suas Atrações' if signed_in?
    link_text ||= 'Atrações'

    link_to link_text, attractions_path, args
  end

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
      'error'   => 'alert-danger',
      'alert'   => 'alert-warning',
      'notice'  => 'alert-success'
    }[type.to_s]

    type_class ||= 'alert-info'
    "alert #{type_class}"
  end
end
