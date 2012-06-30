class ReportsController < ApplicationController

    def filter_ficha_ponto
    end

	def ficha_ponto
		employee = Employee.find_by_registry(params[:registry])
        card_points = []
        current_date_time = nil
		cp = nil
		report = ODFReport::Report.new("#{Rails.root.to_s}/app/reports/ficha_ponto.odt") do |r|

			r.add_field(:employee_name, employee.name)
			r.add_field(:departament_name, employee.department.name)
			r.add_field(:role_name, employee.role.description)

			@points = Point.order("date_time").where("date_time between ? and ? and employee_id = ?", params[:date_start], params[:date_end], employee.id)

			
			@points.each do |p|
                if current_date_time == nil or current_date_time.to_date != p.date_time.to_date
                    card_points << cp unless current_date_time.nil?
                    current_date_time = p.date_time
                    cp = CardPoint.new
                    cp.date_time = p.date_time.strftime("%d/%m/%Y")
                end

                case p.action
                  when 1 then cp.e1 = p.date_time.strftime("%R")
                  when 2 then cp.s2 = p.date_time.strftime("%R")
                  when 3 then cp.e3 = p.date_time.strftime("%R")
                  when 4 then cp.s4 = p.date_time.strftime("%R")
                  when 5 then cp.e5 = p.date_time.strftime("%R")
                  when 6 then cp.s6 = p.date_time.strftime("%R")
                end

            end

            card_points << cp

            r.add_table("TABLE_POINTS", card_points, :header => true, :skip_if_empty => true) do |t|
            	t.add_column(:date_time)
                t.add_column(:e1)
                t.add_column(:s2)
                t.add_column(:e3)
                t.add_column(:s4)
                t.add_column(:e5)
                t.add_column(:s6) 
            end
		end

		report_file_name = report.generate

		send_file(report_file_name)
	end
end
