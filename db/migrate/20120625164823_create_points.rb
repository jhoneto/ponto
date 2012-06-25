class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer     :employee_id
      t.datetime    :date_time
      t.timestamps
    end
  end
end
