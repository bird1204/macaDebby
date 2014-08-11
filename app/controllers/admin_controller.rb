class AdminController < ActionController::Base
  #before_filter :login_required
  def login_required
    if current_employee.blank?
      respond_to do |format|
        format.html(authenticate_employee!)
        # format.js(render :partial => "common/not_logined")
        format.all(head(:unauthorized))
      end 
    end
  end

  def current_user
    current_employee
  end
  # 後台 search 功能串 SQL, type 暫時 text(keyword) 跟 value
  # params_name : params 的 hash 名稱
  # fields      : 要搜尋什麼資料庫的什麼欄位, 可以跨資料表把欄位寫出來
  # Ex: A join B, 要搜尋 B 的欄位, 即 B.field (不懂請教炳哥)
  # type        : 分兩種, [value, keyword] value = 值, keyword = 就是 Like 的時候會用到
  # Ex: search_sql_merge(sql, "enabled", "products.enabled", "value")
  # Ex: search_sql_merge(sql, "name_normal", "name_normal", "keyword")
  def search_sql_merge(sql, params_name, fields, type)
    sql_where_keyword = sql[0].include?("where") ? " and " : " where "

    case type
    when "keyword"
      if params[params_name.to_sym].present? # Get 館別編號 ＆ 串 Where 條件式
        sql_where_keyword = sql[0].include?("where") ? " and " : " where "

        lik_str = ""
        # 將陣列中的 keyword 拆解塞入 like 中
        fields.each_with_index do |field, i|
          lik_str << "(" + field + " like ?" if i == 0
          lik_str << " or " + field + " like ?" if i > 0
          sql << "%#{params[params_name.to_sym]}%"
        end

        sql[0] << "#{sql_where_keyword}#{lik_str})"
      end
    when "value"
      if params[params_name.to_sym].present? # Get 館別編號 ＆ 串 Where 條件式
        sql_where_keyword = sql[0].include?("where") ? " and " : " where "
        sql[0] << "#{sql_where_keyword}#{fields} = ?"
        sql << params[params_name.to_sym]
      end
    end

    return sql
  end
end
