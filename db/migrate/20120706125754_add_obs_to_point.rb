class AddObsToPoint < ActiveRecord::Migration
  def change
		add_column :points, :obs, :string, :limit => 2000
  end
end
