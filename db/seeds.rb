AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

#Users
40.times do 
  random_uid = Random.new.rand(300000..302715)
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  
  User.create!(
    email: Faker::Internet.email,
    password: Devise.friendly_token[0,20],
    provider: "Facebook",
    uid: random_uid,
    name: "#{first_name} #{last_name}",
    first_name: first_name, 
    last_name: last_name,
    image: "http://graph.facebook.com/#{random_uid}/picture?type=square",
    large_image: "http://graph.facebook.com/#{random_uid}/picture?type=large",
    gender: random_uid%2 == 0 ? "Male" : "Female"
  ) 
end


require 'csv'
CSV.foreach("db/data/test_data.csv") do |row|
  Make.create(
      make_id: row[0],
      make: row[1],
      make_slug: row[2],
      name: row[3],
      trim: row[4],
      year: row[5],
      body: row[6],
      engine_position: row[7],
      engine_cc: row[8],
      engine_num_cyl: row[9],
      engine_type: row[10],
      engine_valves_per_cyl: row[11],
      engine_rpm: row[13],
      engine_torque_rpm: row[15],
      engine_fuel: row[19],
      top_speed: row[20],
      drive: row[22],
      transmission: row[23], 
      seats: row[24],
      doors: row[25],
      weight: (row[26].to_f*2.204).round(0),
      length: (row[27].to_f/304.8).round(1),
      width: (row[28].to_f/304.8).round(1),
      height: (row[29].to_f/304.8).round(1)
    )
end

20.times do 
  Car.create!(
    make_id: Random.new.rand(1..15).to_s,
    user_id: Random.new.rand(1..15).to_s,
    vin: 12345678901234567.to_s,
    plate_number: Random.new.rand(1000000..1000100).to_s,
    image1: File.open(File.join(Rails.root, 'app/assets/images/AcuraMDX1.jpeg')),
    image2: File.open(File.join(Rails.root, 'app/assets/images/AcuraMDX2.jpeg')),
    image3: File.open(File.join(Rails.root, 'app/assets/images/AcuraMDX3.jpeg')),
    image4: File.open(File.join(Rails.root, 'app/assets/images/AcuraMDX4.jpeg')),
    image5: File.open(File.join(Rails.root, 'app/assets/images/AcuraMDX5.png')),
    image6: File.open(File.join(Rails.root, 'app/assets/images/AcuraMDX1.jpeg'))
  )
end