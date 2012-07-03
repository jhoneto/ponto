class AddEnterpriseAndEmployeeToDepartments < ActiveRecord::Migration
  def change
		add_column :departments, :enterprise_id, :integer
		add_column :departments, :employee_id, :integer
  end
end
