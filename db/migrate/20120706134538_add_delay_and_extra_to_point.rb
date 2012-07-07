class AddDelayAndExtraToPoint < ActiveRecord::Migration
  def change
		add_column :points, :delay, :integer
		add_column :points, :extra, :integer
  end
end
