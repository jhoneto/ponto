class AddEnterpriseToOfficeHours < ActiveRecord::Migration
  def change
		add_column :office_hours, :enterprise_id, :integer
  end
end
