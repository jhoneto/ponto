class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.binary :fingerprint
      t.timestamps
    end
  end
end
