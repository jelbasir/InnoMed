class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :phoneNo
      t.string :email
      t.string :gender
      t.text :address
      t.string :insurance

      t.timestamps
    end
  end
end
