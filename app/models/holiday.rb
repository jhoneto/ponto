class Holiday < ActiveRecord::Base
  belongs_to :enterprise, :class_name => "Enterprise", :foreign_key => "enterprise_id"
	validates_presence_of :name
	validates_presence_of :date

	scope :by_name, lambda {|parameter| where("upper(name) like upper(?)", "%#{parameter}%")}
	scope :by_start_date, lambda {|parameter| where("date >= ?",  Date.parse(parameter).strftime('%Y-%m-%d'))}
	scope :by_end_date, lambda {|parameter| where("date <= ?",  Date.parse(parameter).strftime('%Y-%m-%d'))}

	def self.holiday?(enterprise_id, date)
		Holiday.where("date = ? and (enterprise_id is null or enterprise_id = ?)", date.strftime('%Y-%m-%d'), enterprise_id).first
	end

end
