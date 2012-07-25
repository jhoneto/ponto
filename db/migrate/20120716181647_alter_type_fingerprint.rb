class AlterTypeFingerprint < ActiveRecord::Migration
  def up
  	remove_column :employees, :fingerprint
  	add_column :employees, :fingerprint, :text
  end

  def down
  end
end
