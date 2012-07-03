class Department < ActiveRecord::Base
  belongs_to :enterprise, :class_name => "Enterprise", :foreign_key => "enterprise_id"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "employee_id"
	validates_presence_of :name
	validates_presence_of :enterprise_id
	validates_presence_of :employee_id
	scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}
end
