class AddIndexToPatientsEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :patients, :email, unique: true
  end
end
