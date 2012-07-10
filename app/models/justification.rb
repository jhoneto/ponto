class Justification < ActiveRecord::Base
  default_scope :order => 'start_date ASC'
  belongs_to :employee, :class_name => "Employee", :foreign_key => "employee_id"
  
  validates_presence_of :description
  validates_presence_of :employee_id
  validates_presence_of :start_date
  validates_presence_of :end_date
  
  scope :by_employee, lambda {|parameter| where("employee_id = ?", parameter)}
  scope :by_start_date, lambda {|parameter| where("start_date >= ?",  Date.parse(parameter).strftime('%Y-%m-%d'))}
  scope :by_end_date, lambda {|parameter| where("end_date <= ?",  Date.parse(parameter).strftime('%Y-%m-%d'))}
  
  
  def self.get_justification(employee_id, date)
    Justification.where("employee_id = ?  and ? between start_date and end_date", employee_id, date.strftime('%Y-%m-%d')).first
  end
end
