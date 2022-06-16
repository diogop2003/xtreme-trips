
puts "Creating Users"

diogo = User.create(email: 'diogo@gmail.com', password: '123123', name: 'Diogo')
file = URI.open('https://res.cloudinary.com/diogop2003/image/upload/c_thumb,g_face,h_150,w_150/v1/production/wfpzong07oezbjpcd12lg89lk57s')
diogo.photo.attach(io: file, filename: 'diogo.png', content_type: 'image/png')

heitor = User.create(email: "heitor@gmail.com", password: "123123", name: "Heitor")

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1650513728/hl8yhhe6rtxt48j423zm.jpg')
heitor.photo.attach(io: file, filename: 'heitor.png', content_type: 'image/png')

puts "Users created"

puts "Creating Trails..."
trail_dg = Trail.create(name: 'Trilha Pedra da Gávea', distance: 6.0, mode: 'Hiking', user: diogo)
file = URI.open('http://s2.glbimg.com/gaNhE8TYkLAWgzz3vf_qmObqlfs=/e.glbimg.com/og/ed/f/original/2014/01/15/bra_1334-web62_copy.jpg')
trail_dg.photo.attach(io: file, filename: 'trail_dg.png', content_type: 'image/png')

trail_dg1 = Trail.create(name: 'Trilha da Pedra Bonita', distance: 8.5, mode: 'Hiking', user: diogo)
file = URI.open('https://www.viajali.com.br/wp-content/uploads/2022/04/trilha-da-pedra-bonita-00.png')
trail_dg1.photo.attach(io: file, filename: 'trail_dg1.png', content_type: 'image/png')


trail_h = Trail.create(name: "Trilha do Pico do Jaraguá", distance: 4.0, mode: "Hiking", user: heitor)

file = URI.open('http://guru.pedalpower.com.br/wp-content/uploads/2017/12/jaragua-min.jpg')
trail_h.photo.attach(io: file, filename: 'trail_h.png', content_type: 'image/png')

puts "Trails created"


puts "Creating Checkpoints..."
array_dg = [
  [-23.002060751257382, -43.295820044819756],
  [-23.00049555927004, -43.29496412136458],
  [-22.998604801127268, -43.293815627144184],
  [-22.997649246615286, -43.294389874254385],
  [-22.99712063908583, -43.29328555288862],
  [-22.996978321320398, -43.2917836758312],
  [-22.99677500996668, -43.28913330455339],
  [-22.995941430215247, -43.28829402031541],
  [-22.995372153280982, -43.28787437819642],
  [-22.99461989079328, -43.28597494544733],
  [-22.9955551354145, -43.28544487119177],
  [-22.997811894669464, -43.28522400691862],
]

array_dg.each do |coordinates|
  Checkpoint.create(trail: trail_dg, user: diogo, latitude: coordinates[0], longitude: coordinates[1])
end

array_dg1 = [
  [-22.98529882286031, -43.27897594508012],
  [-22.984706200314072, -43.279362183143604],
  [-22.98421234620615, -43.27932999663831],
  [-22.983995049826664, -43.280102472765286],
  [-22.984034558285302, -43.280113201600386],
  [-22.983896278629537, -43.2807032875307],
  [-22.983688858880498, -43.281239729285545],
  [-22.98399106118348, -43.28224976186913],
  [-22.9845944435344, -43.281658603793225],
  [-22.98551725838734, -43.281710008843305],
  [-22.98665147814123, -43.282642005392894],
  [-22.98768188159006, -43.282749390772864],
  [-22.98900691680958, -43.283006416023255],
  [-22.98956295450257, -43.28381604556199],
  [-22.989350004167246, -43.28424013722513],
]

array_dg1.each do |coordinates|
  Checkpoint.create(trail: trail_dg1, user: diogo, latitude: coordinates[0], longitude: coordinates[1])
end

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
