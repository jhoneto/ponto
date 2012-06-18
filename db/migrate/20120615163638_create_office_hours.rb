class CreateOfficeHours < ActiveRecord::Migration
  def change
    create_table :office_hours do |t|
      t.string :name
      t.boolean :is_free
      t.integer :input_tolerance
      t.integer :output_tolerance

      t.timestamps
    end
  end
end
