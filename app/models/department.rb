class Department < ActiveRecord::Base

	validates_presence_of :name
	scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}
end
