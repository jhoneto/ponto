class OfficeHourItem < ActiveRecord::Base
	belongs_to :office_hour, :class_name => "OfficeHour", :foreign_key => "office_hour_id"

	validates_uniqueness_of :day, :scope => :office_hour_id
end
