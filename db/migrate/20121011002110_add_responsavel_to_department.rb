class AddResponsavelToDepartment < ActiveRecord::Migration
  def change
		add_column :departments, :responsible, :string
  end
end
