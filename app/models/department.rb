class Department < ActiveRecord::Base
  belongs_to :enterprise, :class_name => "Enterprise", :foreign_key => "enterprise_id"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "employee_id"
  validates_presence_of :name
  validates_presence_of :enterprise_id
  validates_presence_of :employee_id
  scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}


  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]

    xml.department do
      xml.name self.name
      xml.boss self.employee.name unless self.employee_id.nil?
    end
  end


end
