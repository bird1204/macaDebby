module AdminHelper
  def app_render_enabled_select(enabled_field, options = {})
    case options.to_s
    when "true"  then options = 1
    when "false" then options = 0
    end
    return select_tag(enabled_field, options_for_select([["開啟", 1],["關閉", 0]], {:selected => options}))
  end
end
