class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :auth_type

      t.timestamps
    end
  end
end
