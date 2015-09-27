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
      'error'   => 'alert-error',
      'alert'   => 'alert-block',
      'notice'  => 'alert-info'
    }[type.to_s]

    type_class ||= type.to_s
    "alert #{type_class}"
  end

  def link_to_user_attractions attraction, args = {}
    return unless attraction.user

    nick_name   = attraction.user_email if attraction.user_nick_name.to_s.empty?
    nick_name ||= "@#{ attraction.user_nick_name }"

    link_to nick_name, attractions_user_path( attraction.user_id ), args
  end

  def attraction_actions_links attraction
    edit_attraction_link(attraction).concat( delete_attraction_link(attraction) )
  end

  private

  def edit_attraction_link attraction
    return '' unless can? :edit, attraction

    link_to edit_attraction_path( attraction ) do
            content_tag(:span, nil, class: 'fa fa-edit')
    end 
  end

  def delete_attraction_link attraction
    return '' unless can? :destroy, attraction

    link_to attraction_path( attraction ),
      :method => :delete,
      data: { confirm: "Você tem certeza?" } do
            content_tag(:span, nil, class: 'fa fa-trash-o')
    end
  end
end
