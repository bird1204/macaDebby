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
end
