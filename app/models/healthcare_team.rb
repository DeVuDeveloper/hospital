class HealthcareTeam < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  def doctor_specialty
    doctor ? doctor.specialty : nil
  end

  def doctor_fullname
    doctor ? doctor.fullname : nil
  end

  def doctor_hospital
    doctor ? doctor.hospital : nil
  end

  def start_time
    appointment
  end
end
