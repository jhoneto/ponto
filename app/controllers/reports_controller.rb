class ReportsController < ApplicationController
  def filter_ficha_ponto
  end

  def ficha_ponto
    employee = Employee.find_by_registry(params[:registry])

    report = ODFReport::Report.new("#{Rails.root.to_s}/app/reports/ficha_ponto.odt") do |r|

      r.add_field(:employee_name, employee.name)
      r.add_field(:departament_name, employee.department.name)
      r.add_field(:role_name, employee.role.description)

      puts "1111111111111111111111111"
      card_points = Point.prepare_card_point_single(employee, params[:date_start].to_date, params[:date_end].to_date)
      puts "2222222222222222222222222"

      r.add_table("TABLE_POINTS", card_points, :header => true, :skip_if_empty => true) do |t|
        t.add_column(:date_time)
        t.add_column(:e1)
        t.add_column(:s2)
        t.add_column(:e3)
        t.add_column(:s4)
        t.add_column(:e5)
        t.add_column(:s6)
        t.add_column(:obs)
      end
    end

    report_file_name = report.generate

    send_file(report_file_name)
  end
end
