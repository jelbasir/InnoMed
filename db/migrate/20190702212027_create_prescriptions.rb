class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
      t.text :prescription
      t.decimal :prescription_cost, precision: 7, scale: 2

      t.timestamps
    end
  end
end
