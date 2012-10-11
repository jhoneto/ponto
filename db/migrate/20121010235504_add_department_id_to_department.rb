class AddDepartmentIdToDepartment < ActiveRecord::Migration
  def change
		add_column :departments, :department_id, :integer
  end
end
