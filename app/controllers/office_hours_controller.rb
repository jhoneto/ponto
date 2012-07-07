class OfficeHoursController < InheritedResources::Base
  load_and_authorize_resource
	has_scope :by_name

  def index
    @office_hours = apply_scopes(OfficeHour).all
  end

  def new
    @office_hour  = OfficeHour.new
    7.times { @office_hour.officehouritems.build }
  end
end
