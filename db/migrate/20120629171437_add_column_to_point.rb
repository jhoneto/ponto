class AddColumnToPoint < ActiveRecord::Migration
  def change
  	add_column :points, :action, :integer
  end
end
