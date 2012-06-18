class Role < ActiveRecord::Base

	validates_presence_of :description

	scope :by_description, lambda {|parameter| where("upper(description) like upper(?)", "%#{parameter}%")}
end
