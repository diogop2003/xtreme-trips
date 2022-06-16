
puts "Creating Users"

daniel = User.create(email: "dnl.carvalho@gmail.com", password: "123123", name: "daniel")
heitor = User.create(email: "heitor@gmail.com", password: "123123", name: "Heitor")

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1650513728/hl8yhhe6rtxt48j423zm.jpg')
heitor.photo.attach(io: file, filename: 'heitor.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1651492797/cwwnnzvhfnbltkftmrfh.jpg')
daniel.photo.attach(io: file, filename: 'daniel.png', content_type: 'image/png')

puts "Users created"

puts "Creating Trails..."

trail_h = Trail.create(name: "Trilha do Pico do Jaraguá", distance: 4.0, mode: "Hiking", user: heitor)

file = URI.open('http://guru.pedalpower.com.br/wp-content/uploads/2017/12/jaragua-min.jpg')
trail_h.photo.attach(io: file, filename: 'trail_h.png', content_type: 'image/png')

trail_d = Trail.create(name: "Trilha do Morro da Urca", distance: 5.0, mode: "Hiking", user: daniel)

file = URI.open('http://trilhatranscarioca.com.br/wp-content/uploads/2016/09/MCV_5708-1.jpg')
trail_d.photo.attach(io: file, filename: 'trail_d.png', content_type: 'image/png')

trail_d2 = Trail.create(name: "Parque Municipal (Trilha da Pontinha)", distance: 6.2, mode: "Hiking", user: daniel)

file = URI.open('https://lh5.googleusercontent.com/p/AF1QipNGkL-Fn7el-14Byg5TRP0go84wrTDXnWWLLgZz=w296-h202-n-k-no-v1')
trail_d2.photo.attach(io: file, filename: 'trail_d.png', content_type: 'image/png')

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

array_d = [
  [-22.952443181847034, -43.16085036901502],
  [-22.952534884442453, -43.16149436526352],
  [-22.952822218838968, -43.16168690022441],
  [-22.95310343914677, -43.162071970146194],
  [-22.95331741072848, -43.16223130942418],
  [-22.95344953364382, -43.16269524823645],
  [-22.9534308363976, -43.16322268863966],
  [-22.953664203571154, -43.16364185621495],
  [-22.953895538515187, -43.164445783180916],
  [-22.953864155533484, -43.16459376863582],
  [-22.95378167815686, -43.164723558868744]
]
array_d.each do |coordinates|
  Checkpoint.create(trail: trail_d, user: daniel, latitude: coordinates[0], longitude: coordinates[1])
end

array_d2 = [
  [-23.76663060399539, -46.29813638431848],
  [-23.76885831424244, -46.30066331109054],
  [-23.77109698226227, -46.298671898670335],
  [-23.77215739050955, -46.297599015097894],
  [-23.77338489541415, -46.29788472100004],
  [-23.774336075406413, -46.298002150791945],
  [-23.77488913607393, -46.297986246937256],
  [-23.775791493166828, -46.29754093900584],
  [-23.77602435849709, -46.29804986235603],
  [-23.776184453169776, -46.29839974715928],
]
array_d2.each do |coordinates|
  Checkpoint.create(trail: trail_d2, user: daniel, latitude: coordinates[0], longitude: coordinates[1])
end




puts "Checkpoints created"
