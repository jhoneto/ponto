class ChangeTablePoints < ActiveRecord::Migration
  def up
    drop_table :points
		create_table :points, :force => true do |t|
		    t.integer     :employee_id
        t.date        :date
        t.time :entry_1
        t.time :exit_1
        t.time :entry_2
        t.time :exit_2
        t.time :entry_3
        t.time :exit_3
		    t.timestamps
		  end
  end

  def down
  end
end
