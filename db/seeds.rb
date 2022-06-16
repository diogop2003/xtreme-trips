
puts "Creating Users"


heitor = User.create(email: "heitor@gmail.com", password: "123123", name: "Heitor")

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1650513728/hl8yhhe6rtxt48j423zm.jpg')
heitor.photo.attach(io: file, filename: 'heitor.png', content_type: 'image/png')

puts "Users created"

puts "Creating Trails..."

trail_h = Trail.create(name: "Trilha do Pico do Jaraguá", distance: 4.0, mode: "Hiking", user: heitor)

file = URI.open('http://guru.pedalpower.com.br/wp-content/uploads/2017/12/jaragua-min.jpg')
trail_h.photo.attach(io: file, filename: 'trail_h.png', content_type: 'image/png')

puts "Trails created"


puts "Creating Checkpoints..."

array_h = [
  [-23.442864647150547, -46.774944091838236],
  [-23.443652042248406, -46.772733962786326],
  [-23.44728535490771, -46.772373403454196],
  [-23.450993849417785, -46.77316215199228]
]

array_h.each do |coordinates|
  Checkpoint.create(trail: trail_h, user: heitor, latitude: coordinates[0], longitude: coordinates[1])
end

puts "Checkpoints created"
