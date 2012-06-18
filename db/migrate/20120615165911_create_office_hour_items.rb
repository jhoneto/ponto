class CreateOfficeHourItems < ActiveRecord::Migration
  def change
    create_table :office_hour_items do |t|
      t.integer :day
      t.time :entry_1
      t.time :exit_1
      t.time :entry_2
      t.time :exit_2
      t.time :entry_3
      t.time :exit_3
      t.integer :office_hour_id

      t.timestamps
    end
  end
end
