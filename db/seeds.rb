# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#  ユーザー
user1 = User.find_or_create_by!(email: "zack@example.com") do |user|
  user.name = "Zack"
  user.password = "password"
  user.introduction = "音楽が好きです"
  user.gender = "男性"
  user.age = "40代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

user2 = User.find_or_create_by!(email: "caesar@example.com") do |user|
  user.name = "Caesar"
  user.password = "password"
  user.introduction = "高音が好きです"
  user.gender = "男性"
  user.age = "20代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

user3 = User.find_or_create_by!(email: "tim@example.com") do |user|
  user.name = "Tim"
  user.password = "password"
  user.introduction = "低音が好きです"
  user.gender = "男性"
  user.age = "30代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

user4 = User.find_or_create_by!(email: "tom@example.com") do |user|
  user.name = "Tom"
  user.password = "password"
  user.introduction = "ギターが好きです"
  user.gender = "男性"
  user.age = "30代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

user5 = User.find_or_create_by!(email: "brad@example.com") do |user|
  user.name = "Brad"
  user.password = "password"
  user.introduction = "寝ることが好きです"
  user.gender = "男性"
  user.age = "50代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

user6 = User.find_or_create_by!(email: "nicole@example.com") do |user|
  user.name = "Nicole"
  user.password = "password"
  user.introduction = "食べることが好きです"
  user.gender = "女性"
  user.age = "20代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end


#  アーティスト
artist1 = user1.artists.find_or_create_by!(name: "The Farmer Brothers") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist1.jpg"), filename:"sample-artist1.jpg")
  artist.introduction = "そのサウンドは70年代の温もりと現代のクールさを兼ね備え、まるでベルベットのように滑らか。リーダーのキーボード、ジェームズ・パク（韓国系カナダ人）を中心に構成される多国籍メンバーが織りなす音は、まるで都会の交差点で偶然聴こえてくるジャムのように、どこか懐かしく、それでいて洗練されている。"
end

artist2 = Artist.find_or_create_by!(name: "DJ Lumié") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist2.jpg"), filename:"sample-artist2.jpg")
  artist.introduction = "わずか17歳でヨーロッパのアンダーグラウンドシーンを騒がせた逸材。来日後、東京のナイトクラブに突如現れ、独自のセンスで光と音を操るライブセットを展開。彼女の音はビートだけでなく「空間」ごと再構築する。テクノ、ハウス、エレクトロが溶け合い、そこに浮かぶのは未来の夢の断片。夜の闇に一筋の光を射す、その存在こそがLumié。"
  artist.user = user1
end

artist3 = Artist.find_or_create_by!(name: "Stringbloods") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist3.jpg"), filename:"sample-artist3.jpg")
  artist.introduction = "兄・エリオット（Gt）と弟・マーカス（Ba）の血で結ばれたデュオ。幼少期から一緒に演奏を始め、家のガレージで培った息の合ったグルーヴが武器。ロックンロールの粗さと、ファンクの緻密なリズムがぶつかり合いながら融合する。"
  artist.user = user2
end

artist4 = Artist.find_or_create_by!(name: "Midnight Kaze") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist4.jpg"), filename:"sample-artist4.jpg")
  artist.introduction = "現れてはグルーヴを残して消える、謎多きセッションベーシスト。驚異的なフィンガリング、意外性のあるライン、空間を操るようなタッチ。ジャンルの枠にとらわれず、ジャズ、フュージョン、ヒップホップ、さらには民族音楽すらベース一本で繋ぐ。"
  artist.user = user3
end

#  トピックジャンル
topic_genre1 = TopicGenre.find_or_create_by!(name: "CD")
topic_genre2 = TopicGenre.find_or_create_by!(name: "ライブ")
topic_genre3 = TopicGenre.find_or_create_by!(name: "イベント")
topic_genre4 = TopicGenre.find_or_create_by!(name: "その他")

#  トピック
topic1 = user1.topics.find_or_create_by!(title: "1stアルバムについて") do |topic|
  topic.topic_genre = topic_genre1
  topic.artist = artist1
  topic.body = "すごく出来がいいと思う。"
end

topic2 = user1.topics.find_or_create_by!(title: "2stアルバムについて") do |topic|
  topic.topic_genre = topic_genre1
  topic.artist = artist1
  topic.body = "今回は不作です。"
end

topic3 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre3
  topic.artist = artist2
  topic.body = "楽しみにしています。"
end

#  トピックのコメント
Comment.find_or_create_by!(body: "同じく", topic: topic1, user: user2)
Comment.find_or_create_by!(body: "そうは思わない", topic: topic1, user: user4)
Comment.find_or_create_by!(body: "Me too.", topic: topic2, user: user6)


#  サークル
group1 = Group.find_or_initialize_by(name: "ギタリストの集い")
group1.introduction = "初心者上級者問わず語り合いましょう。"
group1.owner = user4
group1.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group1.jpg"), filename: "sample-group1.jpg")
group1.save!

group2 = Group.find_or_initialize_by(name: "レコード収集家")
group2.introduction = "レコードを集める人が集まるサークルです。情報交換をしていきたいです。"
group2.owner = user2
group2.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group2.jpg"), filename: "sample-group2.jpg")
group2.save!

group3 = Group.find_or_initialize_by(name: "楽器破壊部")
group3.introduction = "楽器を破壊する"
group3.owner = user4
group3.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group3.jpg"), filename: "sample-group3.jpg")
group3.save!

group4 = Group.find_or_initialize_by(name: "ボーカルトレーニング")
group4.introduction = "練習法などを語りたいです。"
group4.owner = user6
group4.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group4.jpg"), filename: "sample-group4.jpg")
group4.save!

#  サークルのコメント
GroupComment.find_or_create_by!(body: "初心者にお勧めの曲を教えてください", group: group1, user: user1)
GroupComment.find_or_create_by!(body: "through the fire and flames", group: group1, user: user4)
GroupComment.find_or_create_by!(body: "いい店を見つけました", group: group2, user: user3)