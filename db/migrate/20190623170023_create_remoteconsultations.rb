class CreateRemoteconsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :remoteconsultations do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
