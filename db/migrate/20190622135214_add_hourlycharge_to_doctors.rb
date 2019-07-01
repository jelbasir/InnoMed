class AddHourlychargeToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :hourlycharge, :decimal, :precision => 5, :scale => 2
  end
end
