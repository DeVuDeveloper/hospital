# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Patient.destroy_all
Doctor.destroy_all
HealthcareTeam.destroy_all

# Set up first User Patient
primary_user = User.create(firstname: 'John', lastname: 'Doe', username: 'john', email: 'joxn@example.com',
                           password: 'secret', password_confirmation: 'secret')
primary_user.create_patient(
  medical_record: "Patient is a male, age 72, with Chronic Obstructive Pulmonary Disease (COPD) who over the
  last few weeks has been having more Shortness of Breath (SOB). He states he is unable to walk
  for me today because he is too tired. Therefore he needs a PMD..",
  test_results: '20220922 - Hyperresonant percussion and distant breath sounds throughout. Occ wheezes. ',
  medications: 'Pt has attempted to use cane, walker or manual wheelchair
  unsuccessfully due to extreme fatigue with slight exertion described above. '
)

# Set up first User Admin
admin = User.create(firstname: 'Admin', lastname: 'Doe', username: 'admin', email: 'admin@example.com',
                    password: 'admin', password_confirmation: 'admin', admin: true)

# Instantiate Doctors from CMS JSON Data
JSON.parse(File.read('doctors.json')).each do |doctor|
  user = User.create(firstname: doctor['firstname'], lastname: doctor['lastname'], username: doctor['username'],
                     email: doctor['email'], password: doctor['password'], admin: true)

  user.build_doctor(gender: doctor['gender'], specialty: doctor['specialty'], hospital: doctor['hospital'],
                    address: doctor['address'], city: doctor['city'], state: doctor['state'], zipcode: doctor['zipcode'])

  user.save
end

puts 'Seeding success!'