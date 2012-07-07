class JustificationsController < InheritedResources::Base
  load_and_authorize_resource

  has_scope :by_employee
  has_scope :by_start_date
  has_scope :by_end_date
  def index
    @justifications = apply_scopes(Justification).all
  end
end
