class Point < ActiveRecord::Base

	def self.save_point(fingerprint, employee_registry)
		employee = Employee.find_by_registry(employee_registry)

		if employee.nil?
			3
		else

   	      fingerprintClient = fingerprint
		  fingerprintClient = fingerprintClient.gsub(/\n/,"")
		  fingerprintClient = fingerprintClient.gsub(/\r/,"")
		  fingerprintClient = fingerprintClient.gsub(" ","")
		
		  fingerprintDB = employee.fingerprint
		  fingerprintDB = fingerprintDB.gsub(/\n/,"")
		  fingerprintDB = fingerprintDB.gsub(/\r/,"")
		  fingerprintDB = fingerprintDB.gsub(" ","")

		
		  result =  IO.popen("java -jar #{Rails.root}/public/sgp-app-identify.jar #{fingerprintDB} #{fingerprintClient}").readlines
   		  if(result[0] == 'OK')         
			1
		  elsif(result[0] == 'ERRO')
			2
		  elsif(result[0] == 'NO_ARGS')
			3
		  end
		end


	end
end
