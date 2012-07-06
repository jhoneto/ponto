class Employee < ActiveRecord::Base
  belongs_to :enterprise, :class_name => "Enterprise", :foreign_key => "enterprise_id"
  belongs_to :role, :class_name => "Role", :foreign_key => "role_id"
  belongs_to :department, :class_name => "Department", :foreign_key => "department_id"
  belongs_to :office_hour, :class_name => "OfficeHour", :foreign_key => "office_hour_id"
  has_many :points, :class_name => "Point", :foreign_key => "employee_id"
  has_many :currentpoints, :class_name => "Point", :foreign_key => "employee_id",
           :conditions => lambda {|parameter| "date between '#{date1}' and '#{date2}'"}

  attr_accessor :date1
  attr_accessor :date2

  scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}

  validates_presence_of :name
  validates_presence_of :registry
  validates_presence_of :enterprise_id
  validates_presence_of :office_hour_id

  validates_uniqueness_of :registry

  after_initialize :init
 
  def init
    self.status  ||= 1
  end

  def self.save_fingerprint(registry, fingerprint)
    employee = Employee.find_by_registry(registry)
    if employee.nil?
    -1
    else
    employee.fingerprint = fingerprint
    employee.save
    1
    end
  end
end
