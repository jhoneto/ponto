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
  attr_accessor :delay
  attr_accessor :extra
  attr_accessor :faults
  attr_accessor :delay_number

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

  def self.migrate_employee(employee_id)
    employee = Employee.find(employee_id)
    puts employee.name
    databases = Database.all
    databases.each do |database|
      puts database.name.to_sym
      employee_slave = Employee.using(database.name.to_sym).where(:registry => employee.registry).first
      if employee_slave.nil?
        puts "Nao encontrado"

        employee_slave = Employee.using(database.name.to_sym).create(:name => employee.name,
        :registry => employee.registry,
        :fingerprint => employee.fingerprint,
        :enterprise_id => employee.enterprise_id,
        :office_hour_id => employee.office_hour_id)

      else
        puts employee_slave.name
        #employee_slave.name = employee.name
        #employee_slave.fingerprint = employee.fingerprint
        #employee_slave.registry = employee.registry
        #employee_slave.save
        employee_slave.update_attributes(:name => employee.name,
        :registry => employee.registry,
        :fingerprint => employee.fingerprint,
        :enterprise_id => employee.enterprise_id,
        :office_hour_id => employee.office_hour_id)
        puts "Encontrado"
      end

    end
  end
end
