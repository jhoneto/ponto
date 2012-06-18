class DepartmentsController < InheritedResources::Base

  has_scope :by_name

  def index
    @departments = apply_scopes(Department).all
  end

end
