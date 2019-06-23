class AddRemoteconsultationIdToConsultations < ActiveRecord::Migration[5.1]
  def change
      add_column :consultations, :remoteconsultation_id, :integer
  end
end
