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

user7 = User.find_or_create_by!(email: "angy@example.com") do |user|
  user.name = "Angy"
  user.password = "password"
  user.introduction = "ピアノの音色に癒される毎日。"
  user.gender = "男性"
  user.age = "40代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end

user8 = User.find_or_create_by!(email: "yui@example.com") do |user|
  user.name = "ゆい"
  user.password = "password"
  user.introduction = "野外フェス常連組です！"
  user.gender = "女性"
  user.age = "20代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

user9 = User.find_or_create_by!(email: "squash@example.com") do |user|
  user.name = "Squash"
  user.password = "password"
  user.introduction = "最近ジャズにハマってます。"
  user.gender = "男性"
  user.age = "40代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

user10 = User.find_or_create_by!(email: "john@example.com") do |user|
  user.name = "John"
  user.password = "password"
  user.introduction = "DIY楽器で音楽制作してます。"
  user.gender = "男性"
  user.age = "30代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
end

user11 = User.find_or_create_by!(email: "nilo@example.com") do |user|
  user.name = "Nilo"
  user.password = "password"
  user.introduction = "世界の伝統音楽を探求中。"
  user.gender = "男性"
  user.age = "50代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")
end

user12 = User.find_or_create_by!(email: "slash@example.com") do |user|
  user.name = "斜線"
  user.password = "password"
  user.introduction = "音響機器マニア。自宅スタジオ完備！"
  user.gender = "男性"
  user.age = "40代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")
end

user13 = User.find_or_create_by!(email: "great@example.com") do |user|
  user.name = "辰吉"
  user.password = "password"
  user.introduction = "歌うことが生きがいです！"
  user.gender = "男性"
  user.age = "20代"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg")
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
artist5 = user7.artists.find_or_create_by!(name: "Velvet Echo") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist5.jpg"), filename:"sample-artist5.jpg")
  artist.introduction = "幻想的なピアノとエレクトロニカを融合させた唯一無二のユニット。静かに心に響く音世界を描く。"
end

artist6 = user8.artists.find_or_create_by!(name: "Sunset Riot") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist6.jpg"), filename:"sample-artist6.jpg")
  artist.introduction = "爆音ギターとグルーヴィーなベースで観客を揺らす、熱狂のロックバンド。フェスでの演奏は必見。"
end

artist7 = user9.artists.find_or_create_by!(name: "Mellow Phase") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist7.jpg"), filename:"sample-artist7.jpg")
  artist.introduction = "深夜のバーが似合う、心地よいジャズトリオ。サックスとウッドベースの掛け合いが絶妙。"
end

artist8 = user10.artists.find_or_create_by!(name: "Circuit Breaks") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist8.jpg"), filename:"sample-artist8.jpg")
  artist.introduction = "廃材から作った電子楽器で奏でる実験的ノイズサウンド。未来の音楽の可能性を示唆する。"
end

artist9 = user11.artists.find_or_create_by!(name: "Earthbound Spirits") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist9.jpg"), filename:"sample-artist9.jpg")
  artist.introduction = "世界各地の民族音楽をミックスし、現代のビートと融合させた新感覚ワールドミュージック。"
end

artist10 = user12.artists.find_or_create_by!(name: "Analog Mind") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist10.jpg"), filename:"sample-artist10.jpg")
  artist.introduction = "ビンテージシンセとリール録音機で作る温もりのあるエレクトロ。音の粒が聴く人を包み込む。"
end

artist11 = user13.artists.find_or_create_by!(name: "グレート辰吉") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist11.jpg"), filename:"sample-artist11.jpg")
  artist.introduction = "空に咲く花のように、透き通る歌声が特徴のシンガーソングライター。自然をテーマにした楽曲多数。"
end

artist12 = user4.artists.find_or_create_by!(name: "Iron Wrath") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist12.jpg"), filename:"sample-artist12.jpg")
  artist.introduction = "鋭いリフと激しいドラムが特徴のメタルバンド..."
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

group5 = Group.find_or_initialize_by(name: "ピアノ好きの会")
group5.introduction = "ジャンル問わずピアノを愛する人の集まりです。"
group5.owner = user7
group5.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group5.jpg"), filename: "sample-group5.jpg")
group5.save!

group6 = Group.find_or_initialize_by(name: "フェス行こうぜ！")
group6.introduction = "一緒にフェスに行く仲間を探すサークルです。"
group6.owner = user8
group6.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group6.jpg"), filename: "sample-group6.jpg")
group6.save!

group7 = Group.find_or_initialize_by(name: "ジャズ研究会")
group7.introduction = "ジャズの歴史や演奏技術について語り合いましょう。"
group7.owner = user9
group7.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group7.jpg"), filename: "sample-group7.jpg")
group7.save!

group8 = Group.find_or_initialize_by(name: "ノイズ音楽ラボ")
group8.introduction = "ノイズや実験音楽に興味ある人集合！"
group8.owner = user10
group8.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group8.jpg"), filename: "sample-group8.jpg")
group8.save!

group9 = Group.find_or_initialize_by(name: "ワールドミュージック探訪")
group9.introduction = "民族音楽や伝統音楽の魅力を語りましょう。"
group9.owner = user11
group9.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group9.jpg"), filename: "sample-group9.jpg")
group9.save!

group10 = Group.find_or_initialize_by(name: "アナログ機材愛好会")
group10.introduction = "レトロな機材が好きな人の集まりです。"
group10.owner = user12
group10.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group10.jpg"), filename: "sample-group10.jpg")
group10.save!

group11 = Group.find_or_initialize_by(name: "ドラマーの集い")
group11.introduction = "ドラム好きな人、ハイハットについて話しましょう！"
group11.owner = user13
group11.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group11.jpg"), filename: "sample-group11.jpg")
group11.save!

#  サークルのコメント
GroupComment.find_or_create_by!(body: "初心者にお勧めの曲を教えてください", group: group1, user: user1)
GroupComment.find_or_create_by!(body: "through the fire and flames", group: group1, user: user4)
GroupComment.find_or_create_by!(body: "いい店を見つけました", group: group2, user: user3)



# フォロー関係
user7.follow(user8)
user8.follow(user7)
user9.follow(user7)
user10.follow(user11)
user11.follow(user10) 
user12.follow(user13)
user13.follow(user12)
user13.follow(user7)

# いいね情報（お気に入りアーティスト）
user7.favorites.find_or_create_by!(artist: artist6)
user7.favorites.find_or_create_by!(artist: artist9)
user8.favorites.find_or_create_by!(artist: artist5)
user8.favorites.find_or_create_by!(artist: artist10)
user9.favorites.find_or_create_by!(artist: artist6)
user9.favorites.find_or_create_by!(artist: artist11)
user10.favorites.find_or_create_by!(artist: artist7)
user10.favorites.find_or_create_by!(artist: artist9)
user11.favorites.find_or_create_by!(artist: artist5)
user12.favorites.find_or_create_by!(artist: artist8)
user12.favorites.find_or_create_by!(artist: artist11)
user13.favorites.find_or_create_by!(artist: artist10)



# サークル参加（他人のサークルに参加した例）
GroupMembership.find_or_create_by!(group: group5, user: user8)
GroupMembership.find_or_create_by!(group: group5, user: user9)
GroupMembership.find_or_create_by!(group: group6, user: user7)
GroupMembership.find_or_create_by!(group: group6, user: user13)
GroupMembership.find_or_create_by!(group: group7, user: user10)
GroupMembership.find_or_create_by!(group: group7, user: user11)
GroupMembership.find_or_create_by!(group: group8, user: user12)
GroupMembership.find_or_create_by!(group: group9, user: user7)
GroupMembership.find_or_create_by!(group: group9, user: user8)
GroupMembership.find_or_create_by!(group: group10, user: user13)
GroupMembership.find_or_create_by!(group: group10, user: user9)
GroupMembership.find_or_create_by!(group: group11, user: user10)
GroupMembership.find_or_create_by!(group: group11, user: user11)