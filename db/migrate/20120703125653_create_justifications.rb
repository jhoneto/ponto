class CreateJustifications < ActiveRecord::Migration
  def change
    create_table :justifications do |t|
      t.integer :employee_id
      t.string :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
