class EmployeesController < InheritedResources::Base
	respond_to :html, :xml, :json, :pdf

  has_scope :by_name

  def index
    @employees = apply_scopes(Employee).all
  end
  
  def new
    @employee = Employee.new
    @departments = []
    @office_hours = []
  end
  
  def edit
    @employee = Employee.find(params[:id])
    @departments = Department.find_all_by_enterprise_id(@employee.enterprise_id)
    @office_hours = OfficeHour.find_all_by_enterprise_id(@employee.enterprise_id)
  end
  
  def get_departments
    @departments = Department.find_all_by_enterprise_id(params[:enterprise_id])
    if @departments.empty?
      @departments = []
    end 
    render :json => @departments.to_json(:only => [:id, :name]) 
  end
  
  def get_office_hours
    @office_hours = OfficeHour.find_all_by_enterprise_id(params[:enterprise_id])
    if @office_hours.empty?
      @office_hours = []
    end
    render :json => @office_hours.to_json(:only => [:id, :name])
  end
end
