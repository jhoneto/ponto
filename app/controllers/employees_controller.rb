class EmployeesController < InheritedResources::Base
	respond_to :html, :xml, :json

  has_scope :by_name

  def index
    @employees = apply_scopes(Employee).all
  end
end
