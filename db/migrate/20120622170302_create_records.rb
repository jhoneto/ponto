class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer    :employee_id
      t.time       :time
      t.timestamps
    end
  end
end
