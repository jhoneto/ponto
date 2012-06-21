class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string     :name
      t.string     :corporate_name
      t.string     :cnpj, :limit => 20
      t.string     :address, :limit => 100
      t.string     :address_number, :limit => 10
      t.string     :address_complement, :limit => 30
      t.string     :address_zip_code, :limit => 9
      t.string     :address_neighborhood, :limit => 60
      t.string     :address_city, :limit => 60
      t.string     :adress_state, :limit => 2
      t.string     :email
      t.string     :phone, :limit => 20
      t.timestamps
    end
  end
end
