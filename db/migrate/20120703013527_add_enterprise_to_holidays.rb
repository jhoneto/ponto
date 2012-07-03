class AddEnterpriseToHolidays < ActiveRecord::Migration
  def change
		add_column :holidays, :enterprise_id, :integer
  end
end
