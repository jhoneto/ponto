class DepartmentsController < InheritedResources::Base
  load_and_authorize_resource

  has_scope :by_name

  def index
    @departments = apply_scopes(Department).all
  end

end
