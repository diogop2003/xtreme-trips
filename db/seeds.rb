
puts "Creating Users..."

daniel = User.create(email: "dnl.carvalho@gmail.com", password: "123123", name: "daniel")
diogo = User.create(email: 'diogo@gmail.com', password: '123123', name: 'Diogo')
file = URI.open('https://res.cloudinary.com/diogop2003/image/upload/c_thumb,g_face,h_150,w_150/v1/production/wfpzong07oezbjpcd12lg89lk57s')
diogo.photo.attach(io: file, filename: 'diogo.png', content_type: 'image/png')

heitor = User.create(email: "heitor@gmail.com", password: "123123", name: "Heitor")

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1650513728/hl8yhhe6rtxt48j423zm.jpg')
heitor.photo.attach(io: file, filename: 'heitor.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1651492797/cwwnnzvhfnbltkftmrfh.jpg')
daniel.photo.attach(io: file, filename: 'daniel.png', content_type: 'image/png')

puts "Users created"

puts "Creating Trails..."
trail_dg = Trail.create(name: 'Trilha Pedra da Gávea', distance: 6.0, mode: 'Hiking', user: diogo)
file = URI.open('http://s2.glbimg.com/gaNhE8TYkLAWgzz3vf_qmObqlfs=/e.glbimg.com/og/ed/f/original/2014/01/15/bra_1334-web62_copy.jpg')
trail_dg.photo.attach(io: file, filename: 'trail_dg.png', content_type: 'image/png')

trail_dg1 = Trail.create(name: 'Trilha da Pedra Bonita', distance: 8.5, mode: 'Hiking', user: diogo)
file = URI.open('https://www.viajali.com.br/wp-content/uploads/2022/04/trilha-da-pedra-bonita-00.png')
trail_dg1.photo.attach(io: file, filename: 'trail_dg1.png', content_type: 'image/png')


trail_h1 = Trail.create(name: "Trilha do Pico do Jaraguá", distance: 4.0, mode: "Bike", user: heitor)
file = URI.open('http://guru.pedalpower.com.br/wp-content/uploads/2017/12/jaragua-min.jpg')
trail_h1.photo.attach(io: file, filename: 'trail_h1.png', content_type: 'image/png')

trail_h2 = Trail.create(name: "Trilha do Caixa D'aço", distance: 7.0, mode: "Hiking", user: heitor)
file = URI.open('http://loucosporpraia.com.br/wp-content/uploads/2013/06/Praia-do-Cachada%C3%A7o-Trindade-por-luis.jpg')
trail_h2.photo.attach(io: file, filename: 'trail_h2.png', content_type: 'image/png')

trail_h3 = Trail.create(name: "Trilha Morro do Castelo", distance: 12.0, mode: "Hiking", user: heitor)
file = URI.open('https://altamontanha.com/wp-content/uploads/2016/03/Vale-do-Paty-do-Alto-do-Morro-do-Castelo-Chapada-Diamantina-BA-1024x734.jpg')
trail_h3.photo.attach(io: file, filename: 'trail_h3.png', content_type: 'image/png')

trail_d = Trail.create(name: "Trilha do Morro da Urca", distance: 5.0, mode: "Hiking", user: daniel)

file = URI.open('http://trilhatranscarioca.com.br/wp-content/uploads/2016/09/MCV_5708-1.jpg')
trail_d.photo.attach(io: file, filename: 'trail_d.png', content_type: 'image/png')

trail_d2 = Trail.create(name: "Parque Municipal (Trilha da Pontinha)", distance: 6.2, mode: "Hiking", user: daniel)

file = URI.open('https://lh5.googleusercontent.com/p/AF1QipNGkL-Fn7el-14Byg5TRP0go84wrTDXnWWLLgZz=w296-h202-n-k-no-v1')
trail_d2.photo.attach(io: file, filename: 'trail_d.png', content_type: 'image/png')

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

array_h1 = [
  [-23.442864647150547, -46.774944091838236],
  [-23.443652042248406, -46.772733962786326],
  [-23.44728535490771, -46.772373403454196],
  [-23.450993849417785, -46.77316215199228],
  [-23.44968232057618, -46.7654225569623],
  [-23.451709873668655, -46.76633455406208],
  [-23.453146894935216, -46.76647407787007],
  [-23.45547267151323, -46.76657391345817],
  [-23.45745097397038, -46.765919444006045],
  [-23.457474156473904, -46.76705879170353],
  [-23.458350134024258, -46.7669407858058]
]
array_h1.each do |coordinates|
  Checkpoint.create(trail: trail_h1, user: heitor, latitude: coordinates[0], longitude: coordinates[1])
end

array_h2 = [
  [-23.349099549619414, -44.722810183864986],
  [-23.35255677461346, -44.722810183864986],
  [-23.354544638202817, -44.72045665252072],
  [-23.35549534504462, -44.72045665252072],
  [-23.356186763923773, -44.721303923804655],
  [-23.356600471286487, -44.72217293872049],
  [-23.35578296019619, -44.722945379196396],
  [-23.354755053895197, -44.72465133693789],
  [-23.353671602311053, -44.72524138898459],
  [-23.35365188501628, -44.72637865962061],
  [-23.35391783133494, -44.727344298244525],
  [-23.354508775216694, -44.72857811914447],
  [-23.355730156675023, -44.730112326552536],
  [-23.356744702885724, -44.730959881048484],
  [-23.358054682120677, -44.73171092152455],
  [-23.359066873477634, -44.73220212156494],
  [-23.360354272522148, -44.73225047825679],
  [-23.3604921760904, -44.73248653739641],
  [-23.36063007594711, -44.73228265512053],
  [-23.36093541471608, -44.73267966993646],
  [-23.361418001634977, -44.73259387231639],
  [-23.362107434385535, -44.732411512792375],
  [-23.362570348541436, -44.731381544536404]
]

array_h2.each do |coordinates|
  Checkpoint.create(trail: trail_h2, user: heitor, latitude: coordinates[0], longitude: coordinates[1])
end

array_h3 = [
  [-12.777480783748956, -41.45746292174538],
  [-12.77718930512692, -41.4559685226882],
  [-12.775513296524691, -41.4552213231596],
  [-12.77382760954248, -41.45526421857609],
  [-12.77313902395945, -41.45549957167649],
  [-12.772159245201589, -41.45457970155434],
  [-12.771059269961851, -41.45438853543218],
  [-12.768960186797441, -41.45240346135905],
  [-12.764994491974772, -41.453701692380186],
  [-12.761394964622934, -41.45494623738188],
  [-12.761332208079171, -41.45248929978836],
  [-12.761803079494667, -41.449699802408915],
  [-12.76190772896081, -41.44927064979232],
  [-12.762043758263479, -41.44891659820432],
  [-12.76262972980795, -41.449227734448314],
  [-12.762943603754406, -41.44917405905237],
  [-12.763535244335811, -41.44787700072276],
  [-12.765375690144213, -41.44433348002002],
  [-12.766034900191373, -41.44299239873228],
  [-12.766568544481954, -41.44293875455228],
  [-12.766976571151043, -41.4427885995282],
  [-12.76733233281172, -41.4431211934442],
  [-12.767677630415449, -41.44255256513621],
  [-12.768148450590951, -41.442767179952135],
  [-12.768671667296422, -41.4424882534962],
  [-12.769048353572641, -41.44142609873222],
  [-12.76948782018554, -41.44149047174822],
  [-12.770494972535916, -41.4411851633928],
  [-12.770913528233791, -41.441786018048035],
  [-12.77129021116954, -41.44239756170002],
  [-12.77157272300298, -41.44321295323601],
  [-12.771311105959327, -41.445283668580146],
  [-12.77154130079136, -41.44603468710014],
  [-12.771468057003897, -41.4476440125001]
]
array_h3.each do |coordinates|
  Checkpoint.create(trail: trail_h3, user: heitor, latitude: coordinates[0], longitude: coordinates[1])
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
