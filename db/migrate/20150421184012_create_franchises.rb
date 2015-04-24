class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :owner_name
      t.string :owner_phone
      t.string :owner_email
      t.string :province
      t.string :zone
      t.string :address
      t.string :zip_code
      t.string :area_code
      t.string :phone_number
      t.string :email
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
