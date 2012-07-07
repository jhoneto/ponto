class ReportsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json, :pdf
 

  def index
    @employees = Employee.find(:all) #apply_scopes(Employee).all
    respond_with @employees, :include => [ :points]
  end

  def filter_ficha_ponto
  end

  def ficha_ponto
    date1 = params[:date_start].to_date.strftime("%Y-%m-%d")
    date2 = params[:date_end].to_date.strftime("%Y-%m-%d")
    @employees = Employee.where("enterprise_id = ? and department_id = ?", params[:by_enterprise], params[:by_department])
    @employees.each do |e|
      e.date1 = date1
      e.date2 = date2
    end
    respond_with @employees, :include => [:currentpoints]
  end
end
