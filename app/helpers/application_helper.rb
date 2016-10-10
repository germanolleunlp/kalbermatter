module ApplicationHelper
  def money(price)
    Money.new(price * 100, 'ARS').format
  end

  def flash_div(level)
    if flash[level].present?
      # level directly corresponds to rails types for 2/3 bootstrap styles.
      # Info notice needs conversion.
      classes = "alert alert-#{level}" + (level == "notice" ? "alert-info" : "")
      content_tag "div", class: classes do
        content_tag "p", flash[level]
      end
    end
  end
end
