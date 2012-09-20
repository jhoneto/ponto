class AlterSizeOfZipAddressColumn < ActiveRecord::Migration
  def up
    remove_column :employees, :address_zip_code
    add_column :employees, :address_zip_code, :string, :length => 10
  end

  def down
    remove_column :employees, :address_zip_code
    add_column :employees, :address_zip_code, :string, :length => 9
  end
end
