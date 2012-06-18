class Holiday < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :date

	scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}
	scope :by_start_date, lambda {|parameter| where("date >= ?",  Date.parse(parameter).strftime('%Y-%m-%d'))}
	scope :by_end_date, lambda {|parameter| where("date <= ?",  Date.parse(parameter).strftime('%Y-%m-%d'))}

end
