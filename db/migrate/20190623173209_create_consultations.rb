class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.string :name
      t.text :consultation

      t.timestamps
    end
  end
end
