class OfficeHour < ActiveRecord::Base
	has_many   :officehouritems , :class_name => "OfficeHourItem"
	accepts_nested_attributes_for :officehouritems, :reject_if => lambda { |a| a[:entry_1].blank? || a[:day].blank? }, :allow_destroy => true

	validates_presence_of :name
	#validates_presence_of :is_free
	validates_presence_of :input_tolerance
	validates_presence_of :output_tolerance

	validates_numericality_of :input_tolerance
	validates_numericality_of :output_tolerance


	scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}
end
