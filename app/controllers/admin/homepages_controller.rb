class Admin::HomepagesController < AdminController
  #layout "sign"

  def index
    if current_employee.present?
      #flash[:alert] = "您無此權限, 請洽詢相關工作人員" unless current_user.can_into_backend?
      render :template => "admin/homepages/index"
    else
      render :template => "admin/homepages/sign_in"
    end
  end
end
