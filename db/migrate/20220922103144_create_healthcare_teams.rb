class CreateHealthcareTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :healthcare_teams do |t|
      t.integer :patient_id
      t.integer :doctor_id

      t.datetime :appointment
      t.text :test_result
      t.text :treatment_plans
      t.text :prescriptions
      t.numeric :billing

      t.timestamps
    end
  end
end
