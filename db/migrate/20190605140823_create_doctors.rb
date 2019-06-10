class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :image_url
      t.string :speciality
      t.text :bio
      t.string :address
      t.string :email
      t.string :phone_no
      t.string :gp_number

      t.timestamps
    end
  end
end
