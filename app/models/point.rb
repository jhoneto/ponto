"# encoding: UTF-8"
class Point < ActiveRecord::Base
  validates_presence_of :employee_id
  validates_presence_of :date_time
  validates_presence_of :action
  def self.save_point(fingerprint, employee_registry)
    employee = Employee.find_by_registry(employee_registry)

    if employee.nil?
      "Colaborador nao identifcado"
    else
      result = validate_fingerprint(fingerprint, employee)

      if(result[0] == 'OK')
        old_point = get_last_point(employee)
        if old_point.nil?
          registry_input(old_point, employee)
        else
          if (old_point.action % 2) > 0
            registry_output(old_point, employee)
          else
            registry_input(old_point, employee)
          end
        end
      elsif(result[0] == 'ERRO')
        "Digital nao confere com a matricula ou nao esta cadastrada"
      elsif(result[0] == 'NO_ARGS')
        "Parametros invalidos"
      end
    end
  end

  def self.registry_input(last_point, employee)
    if (last_point.nil?)
      p = Point.new
      p.action = 1
      p.employee_id = employee.id
      p.date_time = Time.now
      p.save
      "Entrada registrada com sucesso"
    else
      tolerancia_saida = employee.office_hour.output_tolerance
      if ((Time.now - last_point.date_time)/60) >= tolerancia_saida
        p = Point.new
        p.action = last_point.action + 1
        p.employee_id = employee.id
        p.date_time = Time.now
        p.save
        "Entrada registrada com sucesso"
      else
        "Saida ja registrada"
      end
    end
  end

  def self.registry_output(last_point, employee)
    tolerancia_entrada = employee.office_hour.input_tolerance
    if ((Time.now - last_point.date_time)/60) >= tolerancia_entrada
      p = Point.new
      p.action = last_point.action + 1
      p.employee_id = employee.id
      p.date_time = Time.now
      p.save
      "Saida registrada com sucesso"
    else
      "Entrada ja registrada"
    end
  end

  def self.get_last_point(employee)
    Point.order("date_time DESC").where("employee_id = ?  and date_time >= ?", employee.id, Time.now.to_date).first
  end

  def self.validate_fingerprint(fingerprint, employee)
    fingerprintClient = fingerprint
    fingerprintClient = fingerprintClient.gsub(/\n/,"")
    fingerprintClient = fingerprintClient.gsub(/\r/,"")
    fingerprintClient = fingerprintClient.gsub(" ","")

    fingerprintDB = employee.fingerprint
    fingerprintDB = fingerprintDB.gsub(/\n/,"")
    fingerprintDB = fingerprintDB.gsub(/\r/,"")
    fingerprintDB = fingerprintDB.gsub(" ","")

    IO.popen("java -jar #{Rails.root}/public/sgp-app-identify.jar #{fingerprintDB} #{fingerprintClient}").readlines
  end

  def self.prepare_card_point_single(employee, start_date, end_date)
    current_date_time =  start_date
    last_date_time = end_date
    office_hour_items = employee.office_hour.officehouritems
    card_points = []
    cp = nil
    faults = 0
    delays = 0

    while current_date_time <= last_date_time do
      current_hour_item = nil
      office_hour_items.each do |hi|
        if (hi.day == current_date_time.wday)
        current_hour_item = hi
        end
      end
      cp = CardPoint.new
      cp.date_time = current_date_time.strftime("%d/%m/%Y")
      points = Point.order("date_time").where("cast(date_time as date) = ? and employee_id = ?", current_date_time.strftime("%Y-%m-%d"), employee.id)
      if points.empty?
        unless current_hour_item.nil?
          cp.obs = "Falta"
          faults = faults + 1 
        end
      else
        comparsion_date = Time.now
        points.each do |p|
          case p.action
          when 1 then
            cp.e1 = p.date_time.strftime("%R")
            comparsion_date = p.date_time.change(:hour => current_hour_item.entry_1.hour, :min => current_hour_item.entry_1.min)
            if (!current_hour_item.nil?) && (!current_hour_item.entry_1.nil?) && ((p.date_time - comparsion_date)/60 > employee.office_hour.input_tolerance)
              delays = delays + ((p.date_time - comparsion_date)/60)
              cp.obs = "Ent. atrasada"
            end
          when 2 then 
            cp.s2 = p.date_time.strftime("%R")
            comparsion_date = p.date_time.change(:hour => current_hour_item.exit_1.hour, :min => current_hour_item.exit_1.min)
            if (!current_hour_item.nil?) && (!current_hour_item.exit_1.nil?) && ((comparsion_date - p.date_time)/60 > employee.office_hour.output_tolerance)
              delays = delays + ((comparsion_date - p.date_time)/60)
              cp.obs = "Saida antec."
            end
          when 3 then
            cp.e3 = p.date_time.strftime("%R")
            comparsion_date = p.date_time.change(:hour => current_hour_item.entry_2.hour, :min => current_hour_item.entry_2.min)
            if (!current_hour_item.nil?) && (!current_hour_item.entry_2.nil?) && ((p.date_time - comparsion_date)/60 > employee.office_hour.input_tolerance)
              delays = delays + ((p.date_time - comparsion_date)/60)
              cp.obs = "Ent. atrasada"
            end
          when 4 then 
            cp.s4 = p.date_time.strftime("%R")
            comparsion_date = p.date_time.change(:hour => current_hour_item.exit_2.hour, :min => current_hour_item.exit_2.min)
            if (!current_hour_item.nil?) && (!current_hour_item.exit_2.nil?) && ((comparsion_date - p.date_time)/60 > employee.office_hour.output_tolerance)
              delays = delays + ((comparsion_date - p.date_time)/60)
              cp.obs = "Saida antec."
            end
          when 5 then 
            cp.e5 = p.date_time.strftime("%R")
            comparsion_date = p.date_time.change(:hour => current_hour_item.entry_3.hour, :min => current_hour_item.entry_3.min)
            if (!current_hour_item.nil?) && (!current_hour_item.entry_2.nil?) && ((p.date_time - comparsion_date)/60 > employee.office_hour.input_tolerance)
              delays = delays + ((p.date_time - comparsion_date)/60)
              cp.obs = "Ent. atrasada"
            end
          when 6 then 
            cp.s6 = p.date_time.strftime("%R")
            comparsion_date = p.date_time.change(:hour => current_hour_item.exit_3.hour, :min => current_hour_item.exit_3.min)
            if (!current_hour_item.nil?) && (!current_hour_item.exit_3.nil?) && ((comparsion_date - p.date_time)/60 > employee.office_hour.output_tolerance)
              delays = delays + ((comparsion_date - p.date_time)/60)
              cp.obs = "Saida antec."
            end
          end
        end
      end
      card_points << cp
      current_date_time = current_date_time + 1.day
    end
    delay_time = Time.now.change(:hour => 0, :min => 0)
    delay_time = delay_time + delays.minute
    return card_points, faults, delay_time.strftime("%R")
  end

end
