class ActionView::Base
  
  private
  
  def render_partial_with_comments(options = {})
      r = %{<!-- render_begin '#{options[:partial]}' -->}
      r << (render_partial_without_comments(options) || "")
      r << %{<!-- render_end '#{options[:partial]}' -->}
      r.html_safe
  end

  alias_method :render_partial_without_comments, :render_partial
  alias_method :render_partial, :render_partial_with_comments
end