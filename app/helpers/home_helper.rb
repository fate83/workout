module HomeHelper
  def boolean_glyphicon bool
    content_tag(:i, nil, class: "glyphicon glyphicon-#{bool ? 'ok' : 'remove'}")
  end
end
