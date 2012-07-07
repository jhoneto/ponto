class HolidaysController < InheritedResources::Base
  load_and_authorize_resource
	has_scope :by_name
	has_scope :by_start_date
	has_scope :by_end_date

  def index
    @holidays = apply_scopes(Holiday).all
  end
end
