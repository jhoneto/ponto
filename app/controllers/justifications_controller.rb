class JustificationsController < InheritedResources::Base

  has_scope :by_employee
  has_scope :by_start_date
  has_scope :by_end_date
  def index
    @justifications = apply_scopes(Justification).all
  end
end
