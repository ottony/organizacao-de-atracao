module AttractionHelper
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
