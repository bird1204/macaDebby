class Admin::EmployeesController < AdminController
  before_filter :init_employee, :only => [:edit,:update,:show,:destroy]
  def index
    @employees = Employee.employee_enabled.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @employee = Employee.new
    @role = "INTERN"
  end

  def create
    employee = Employee.new(params[:employee])
    employee.password = "19911204"
    employee.save!
    redirect_to_success_path
  rescue Exception => e
    logger.error(e)
    redirect_to_alert_path(e)
  end

  def edit
    @role = @employee.role
  end

  def update
    @employee.update_attributes!(params[:employee])
    redirect_to_success_path
  rescue Exception => e
    logger.error(e)
    redirect_to_alert_path(e)    
  end

  def destroy
    @employee.enabled = false
    @employee.save
    redirect_to_success_path
  rescue Exception => e
    logger.error(e)
    redirect_to_alert_path(e) 
  end

  private
  def init_employee
    @employee = Employee.find(params[:id])
  end

  def redirect_to_success_path
    redirect_to admin_employees_path, :notice => "成功"
  end

  def redirect_to_alert_path(error_message)
    redirect_to admin_employees_path, :notice => "失敗, #{error_message}"
  end
end
