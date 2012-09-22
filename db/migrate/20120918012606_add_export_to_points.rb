class AddExportToPoints < ActiveRecord::Migration
  def change
		add_column :points, :exported, :boolean, :null => false, :default => false
  end
end
