class AddFieldsEmployees < ActiveRecord::Migration
  def up
  	drop_table :employees
  	create_table :employees do |t|
      t.string     :name
      t.string     :fingerprint, :limit => 2000
      t.string     :cpf, :limit => 20
      t.string     :sex, :limit => 1
      t.string     :registry
      t.string     :password
      t.integer    :enterprise_id
      t.date       :date_of_birth
      t.string     :address, :limit => 100
      t.string     :address_number, :limit => 10
      t.string     :address_complement, :limit => 30
      t.string     :address_zip_code, :limit => 9
      t.string     :address_neighborhood, :limit => 60
      t.string     :address_city, :limit => 60
      t.string     :adress_state, :limit => 2
      t.string     :email
      t.string     :phone, :limit => 20
      t.string     :cel_phone, :limit => 20
      t.string     :rg_number, :limit => 40
      t.string     :rg_issuing, :limit => 20
      t.date       :rg_issue_date
      t.string     :ctps_number, :limit => 40
      t.string     :cpts_series, :limit => 20
      t.string     :cpts_uf, :limit => 2
      t.string     :nit_pis_pasep, :limit => 60
      t.date       :date_of_admission
      t.integer    :office_hour_id
      t.integer    :role_id
      t.integer    :department_id
      t.integer    :status
      t.text       :obs
      t.timestamps
    end
  end

  def down
  end
end
 