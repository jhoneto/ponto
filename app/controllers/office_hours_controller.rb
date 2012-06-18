class OfficeHoursController < InheritedResources::Base
	has_scope :by_name

  def index
    @office_hours = apply_scopes(OfficeHour).all
  end

  def new
    @office_hour  = OfficeHour.new
    7.times { @office_hour.officehouritems.build }
  end
end
