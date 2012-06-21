class Employee < ActiveRecord::Base
	belongs_to :enterprise, :class_name => "Enterprise", :foreign_key => "enterprise_id"
	belongs_to :role, :class_name => "Role", :foreign_key => "role_id"
	belongs_to :department, :class_name => "Department", :foreign_key => "department_id"
	belongs_to :office_hour, :class_name => "OfficeHour", :foreign_key => "office_hour_id"
end
