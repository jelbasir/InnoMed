# frozen_string_literal: true

[
  { first_name: 'Holly', last_name: 'Christmas', email: 'holly@gmail.com' },
  { first_name: 'Rachel', last_name: 'Green', email: 'iliketoshop@gmail.com' },
  { first_name: 'Ross', last_name: 'Gellar', email: 'ross123@hotmail.com' },
  { first_name: 'Charlie', last_name: 'Brown', email: 'charlie@gmail.com' },
  { first_name: 'Lucy', last_name: 'van Pelt', email: 'bluedresses4va@gmail.com' }
].each do |data|
  Patient.create(
    first_name: data[:first_name],
    last_name: data[:last_name],
    email: data[:email],
    password: 'G2BDyXr1Afcf'
  )
end

Doctor.create(
  first_name: 'John',
  middle_name: 'Franklin',
  last_name: 'Bennett',
  speciality: 'Physiotherapy',
  bio: 'After first studying for a degree in Sports Rehabilitation at Stalford University John moved north to Glasgow to further his knowledge by completing a post-graduate degree in Rehabilitation Science therapy allowing him to practice as a Chartered Physiotherapist.\r\n\r\nTaking what he learnt in sport and keeping athletes on the field of play, and further post graduate training John has now developed a level of expertise in the treatment and prevention of work related disorders and this is where his main clinical focus now lies.\r\n\r\nAway from work he is a dedicated family man with two young boys and when time permits likes nothing more that getting out into the Scottish countryside.', address: '36 Hillbrook Drive, Perrystown, Dublin 12 R12 7647',
  email: 'john.bennett@innomed.ie',
  phone_no: '01 4555636',
  gp_number: 'D33 M5567',
  password: '3B0h6JMWrroD',
  image_url: 'doctor_john.jpg'
)
