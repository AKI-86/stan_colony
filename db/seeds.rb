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
  user.my_taste = "なんでも"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

user2 = User.find_or_create_by!(email: "caesar@example.com") do |user|
  user.name = "Caesar"
  user.password = "password"
  user.introduction = "高音が好きです"
  user.gender = "男性"
  user.age = "20代"
  user.my_taste = "Midnight kaze"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

user3 = User.find_or_create_by!(email: "tim@example.com") do |user|
  user.name = "Tim"
  user.password = "password"
  user.introduction = "低音が好きです"
  user.gender = "男性"
  user.age = "30代"
  user.my_taste = "Midnight kaze"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

user4 = User.find_or_create_by!(email: "tom@example.com") do |user|
  user.name = "Tom"
  user.password = "password"
  user.introduction = "ギターが好きです"
  user.gender = "男性"
  user.age = "30代"
  user.my_taste = "機械サウンド"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

user5 = User.find_or_create_by!(email: "brad@example.com") do |user|
  user.name = "Brad"
  user.password = "password"
  user.introduction = "寝ることが好きです"
  user.gender = "男性"
  user.age = "50代"
  user.my_taste = "ヒーリングミュージック"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

user6 = User.find_or_create_by!(email: "nicole@example.com") do |user|
  user.name = "Nicole"
  user.password = "password"
  user.introduction = "食べることが好きです"
  user.gender = "女性"
  user.age = "20代"
  user.my_taste = "Midnight kaze"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end

user7 = User.find_or_create_by!(email: "angy@example.com") do |user|
  user.name = "Angy"
  user.password = "password"
  user.introduction = "ピアノの音色に癒される毎日。"
  user.gender = "男性"
  user.age = "40代"
  user.my_taste = "Midnight kaze"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end

user8 = User.find_or_create_by!(email: "yui@example.com") do |user|
  user.name = "ゆい"
  user.password = "password"
  user.introduction = "野外フェス常連組です！"
  user.gender = "女性"
  user.age = "20代"
  user.my_taste = "ラウド系"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

user9 = User.find_or_create_by!(email: "squash@example.com") do |user|
  user.name = "Squash"
  user.password = "password"
  user.introduction = "最近ジャズにハマってます。"
  user.gender = "男性"
  user.age = "40代"
  user.my_taste = "Midnight kaze"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

user10 = User.find_or_create_by!(email: "john@example.com") do |user|
  user.name = "John"
  user.password = "password"
  user.introduction = "DIY楽器で音楽制作してます。"
  user.gender = "男性"
  user.age = "30代"
  user.my_taste = "聴かない"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
end

user11 = User.find_or_create_by!(email: "nilo@example.com") do |user|
  user.name = "Nilo"
  user.password = "password"
  user.introduction = "世界の伝統音楽を探求中。"
  user.gender = "男性"
  user.age = "50代"
  user.my_taste = "シティポップ"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")
end

user12 = User.find_or_create_by!(email: "slash@example.com") do |user|
  user.name = "line"
  user.password = "password"
  user.introduction = "音響機器マニア。自宅スタジオ完備！"
  user.gender = "男性"
  user.age = "40代"
  user.my_taste = "特になし"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")
end

user13 = User.find_or_create_by!(email: "great@example.com") do |user|
  user.name = "辰吉"
  user.password = "password"
  user.introduction = "歌うことが生きがいです！"
  user.gender = "男性"
  user.age = "20代"
  user.my_taste = "グレート辰吉"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg")
end

user14 = User.find_or_create_by!(email: "bj@example.com") do |user|
  user.name = "BJ"
  user.password = "password"
  user.introduction = "バンジョーを弾くことに命を懸けてます"
  user.gender = "男性"
  user.age = "30代"
  user.my_taste = "Midnight kaze"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.jpg"), filename:"sample-user14.jpg")
end

user15 = User.find_or_create_by!(email: "shin@example.com") do |user|
  user.name = "Shinnosuke"
  user.password = "password"
  user.introduction = "HIPHOPで生きていく"
  user.gender = "男性"
  user.age = "20代"
  user.my_taste = "演歌"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename:"sample-user15.jpg")
end

user16 = User.find_or_create_by!(email: "ana@example.com") do |user|
  user.name = "ana"
  user.password = "password"
  user.introduction = "レコードを集めたい"
  user.gender = "女性"
  user.age = "20代"
  user.my_taste = "レコード"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user16.jpg"), filename:"sample-user16.jpg")
end

user17 = User.find_or_create_by!(email: "ore@example.com") do |user|
  user.name = "MidnightOre"
  user.password = "password"
  user.introduction = "ベーシストになりたてです"
  user.gender = "男性"
  user.age = "50代"
  user.my_taste = "グレート辰吉"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user17.jpg"), filename:"sample-user17.jpg")
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

artist12 = user1.artists.find_or_create_by!(name: "Iron Wrath") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist12.jpg"), filename:"sample-artist12.jpg")
  artist.introduction = "鋭いリフと激しいドラムが特徴のメタルバンド..."
end

artist13 = user1.artists.find_or_create_by!(name: "風鈴街") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist13.jpg"), filename:"sample-artist13.jpg")
  artist.introduction = "煌めくシンセと幻想的なメロディで描く、未来都市のサウンドスケープ。エレクトロとドリームポップの融合。"
end

artist14 = user1.artists.find_or_create_by!(name: "Deadly Sins") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist14.jpg"), filename:"sample-artist14.jpg")
  artist.introduction = "アコースティックギターとハーモニカで綴る、旅と郷愁のカントリーフォークユニット。"
end

artist15 = user1.artists.find_or_create_by!(name: "Echo Shade") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist15.jpg"), filename:"sample-artist15.jpg")
  artist.introduction = "深淵なアンビエントとダークウェーブが交錯する音の迷宮。夜の静寂に溶け込むサウンド。"
end

artist16 = user1.artists.find_or_create_by!(name: "大友雄平") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist16.jpg"), filename:"sample-artist16.jpg")
  artist.introduction = "ブルースロックを基盤にした野性的なボーカルと、泥臭くも情熱的なギタープレイが光る。"
end

artist17 = user1.artists.find_or_create_by!(name: "紙飛行機スロウ") do |artist|
  artist.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-artist17.jpg"), filename:"sample-artist17.jpg")
  artist.introduction = "日常の一コマを丁寧に紡ぐ歌詞と、ピアノ主体の優しいメロディで心にそっと寄り添うポップユニット。"
end

#  トピックジャンル
topic_genre1 = TopicGenre.find_or_create_by!(name: "CD")
topic_genre2 = TopicGenre.find_or_create_by!(name: "MV/PV")
topic_genre3 = TopicGenre.find_or_create_by!(name: "ライブ(ネタばれあり)")
topic_genre4 = TopicGenre.find_or_create_by!(name: "ライブ(ネタばれなし)")
topic_genre5 = TopicGenre.find_or_create_by!(name: "イベント")
topic_genre6 = TopicGenre.find_or_create_by!(name: "その他")

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


topic4 = user14.topics.find_or_create_by!(title: "His bass technique is tremendous.") do |topic|
  topic.topic_genre = topic_genre3
  topic.artist = artist4
  topic.body = "All the other bassists should be on their knees."
end


topic5 = user5.topics.find_or_create_by!(title: "The Bass Unleashed") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "Legendary bassist MidnightKaze will perform an unprecedented solo live show with his amazing technique and soulful groove cultivated in his 50-year career!"
end


topic6 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "楽しみにしています。"
end

topic7 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "楽しみにしています。"
end

topic8 = user11.topics.find_or_create_by!(title: "【神降臨】MidnightKazeについて語ろう【渋さとテクの融合】") do |topic|
  topic.topic_genre = topic_genre2
  topic.artist = artist4
  topic.body = "MidnightKazeって何者なんだよ……あのベースライン、完全に別次元。初めて聴いた時、鳥肌立ったわ。"
end

topic9 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "楽しみにしています。"
end

topic10 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "楽しみにしています。"
end

topic11 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "楽しみにしています。"
end

topic12 = user1.topics.find_or_create_by!(title: "2025年8月のフェスについて") do |topic|
  topic.topic_genre = topic_genre4
  topic.artist = artist4
  topic.body = "楽しみにしています。"
end

#  トピックのコメント
Comment.find_or_create_by!(body: "同じく", topic: topic1, user: user2)
Comment.find_or_create_by!(body: "そうは思わない", topic: topic1, user: user4)
Comment.find_or_create_by!(body: "Me too.", topic: topic2, user: user6)
Comment.find_or_create_by!(body: "わかる。渋い音で派手じゃないのに、聴けば聴くほど凄さが分かってくるタイプ。もうベース界の仙人って感じ。", topic: topic8, user: user4)
Comment.find_or_create_by!(body: "あの「Smoke Rain Sessions」ってライブ映像見た？4:32くらいからのスラップ、まじで意味わからんくらい綺麗。あれ、生で弾いてんの信じられん。", topic: topic8, user: user6)
Comment.find_or_create_by!(body: "感情を削ぎ落とした演奏に見えて、実は超エモい。矛盾を成立させてるのがKaze。.", topic: topic8, user: user7)
Comment.find_or_create_by!(body: "いや、「音が重力持ってる」ってのKazeにしか当てはまらん。低音が沈んでく感じ、他のベーシストには真似できない。", topic: topic8, user: user9)
Comment.find_or_create_by!(body: "元々ジャズ畑出身らしいよ。だから音選びが変態的にうまい。しかも曲の構成理解してて、必要なところしか弾かない。", topic: topic8, user: user12)
Comment.find_or_create_by!(body: "Kazeのプレベ（※プレシジョンベース）に憧れて、同じ型買ったけど全然音出せねえ「楽器は同じでも魂が違う」って本当だった。", topic: topic8, user: user5)
Comment.find_or_create_by!(body: "昔のバンド「Gravel Pulse」時代のKazeも良いぞ。今より荒々しいけど、根っこのセンスは変わってない。", topic: topic8, user: user2)
Comment.find_or_create_by!(body: "Kazeのこと話すと、結局「なんか神っぽい」ってなるの草。それが本質なんだろうな。人間味ある神。", topic: topic8, user: user13)
Comment.find_or_create_by!(body: "Kazeの影響で最近ベースソロ聴けるようになってきた自分がいる。昔は「ベースのソロって地味…」とか思ってたけど、Kazeの音は語りかけてくるんだよな。人生語ってる感じ。", topic: topic8, user: user144)
Comment.find_or_create_by!(body: "あの人、SNSもやってないし情報少なすぎるんだけど、たまにセッション動画だけアップされるのズルい。何も言わなくても神の降臨ってバレる。", topic: topic8, user: user3)
Comment.find_or_create_by!(body: "神格化されすぎて逆に聴きづらいわ。どの動画にも「音が空間を支配してる」とかコメントあるけど、ただのベースラインやん…って冷めるときある。", topic: topic8, user: user17)
Comment.find_or_create_by!(body: "たしかに", topic: topic8, user: user17)
Comment.find_or_create_by!(body: "ライブで音外しても「それも味だな…」って思わせるの、Kazeくらいじゃない？普通ならミスなのに、Kazeがやると即興のアートになる。不公平。", topic: topic8, user: user16)
Comment.find_or_create_by!(body: "いいですね", topic: topic3, user: user7)




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
group7.owner = user1
group7.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group7.jpg"), filename: "sample-group7.jpg")
group7.save!

group8 = Group.find_or_initialize_by(name: "ノイズ音楽ラボ")
group8.introduction = "ノイズや実験音楽に興味ある人集合！"
group8.owner = user1
group8.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group8.jpg"), filename: "sample-group8.jpg")
group8.save!

group9 = Group.find_or_initialize_by(name: "ワールドミュージック探訪")
group9.introduction = "民族音楽や伝統音楽の魅力を語りましょう。"
group9.owner = user1
group9.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group9.jpg"), filename: "sample-group9.jpg")
group9.save!

group10 = Group.find_or_initialize_by(name: "アナログ機材愛好会")
group10.introduction = "レトロな機材が好きな人の集まりです。"
group10.owner = user1
group10.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group10.jpg"), filename: "sample-group10.jpg")
group10.save!

group11 = Group.find_or_initialize_by(name: "ドラマーの集い")
group11.introduction = "ドラム好きな人、ハイハットについて話しましょう！"
group11.owner = user1
group11.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-group11.jpg"), filename: "sample-group11.jpg")
group11.save!

#  サークルのコメント
GroupComment.find_or_create_by!(body: "初心者にお勧めの曲を教えてください", group: group1, user: user1)
GroupComment.find_or_create_by!(body: "through the fire and flames", group: group1, user: user4)
GroupComment.find_or_create_by!(body: "いい店を見つけました", group: group2, user: user3)



# フォロー関係
user1.follow(user2)
user2.follow(user1)
user3.follow(user4)
user4.follow(user5)
user5.follow(user3)
user6.follow(user1)
user1.follow(user6)
user2.follow(user7)
user9.follow(user10)
user10.follow(user9)
user7.follow(user8)
user8.follow(user7)
user9.follow(user7)
user10.follow(user11)
user11.follow(user10) 
user12.follow(user13)
user13.follow(user12)
user13.follow(user7)

# いいね情報（お気に入りアーティスト）
user1.favorites.find_or_create_by!(artist: artist2)
user1.favorites.find_or_create_by!(artist: artist4)
user1.favorites.find_or_create_by!(artist: artist7)
user2.favorites.find_or_create_by!(artist: artist4)
user3.favorites.find_or_create_by!(artist: artist4)
user4.favorites.find_or_create_by!(artist: artist4)
user5.favorites.find_or_create_by!(artist: artist6)
user5.favorites.find_or_create_by!(artist: artist4)
user6.favorites.find_or_create_by!(artist: artist9)
user6.favorites.find_or_create_by!(artist: artist4)
user7.favorites.find_or_create_by!(artist: artist1)
user8.favorites.find_or_create_by!(artist: artist10)
user7.favorites.find_or_create_by!(artist: artist6)
user7.favorites.find_or_create_by!(artist: artist9)
user7.favorites.find_or_create_by!(artist: artist4)
user8.favorites.find_or_create_by!(artist: artist4)
user8.favorites.find_or_create_by!(artist: artist5)
user8.favorites.find_or_create_by!(artist: artist10)
user9.favorites.find_or_create_by!(artist: artist6)
user9.favorites.find_or_create_by!(artist: artist11)
user9.favorites.find_or_create_by!(artist: artist4)
user10.favorites.find_or_create_by!(artist: artist4)
user10.favorites.find_or_create_by!(artist: artist7)
user10.favorites.find_or_create_by!(artist: artist9)
user11.favorites.find_or_create_by!(artist: artist5)
user12.favorites.find_or_create_by!(artist: artist8)
user12.favorites.find_or_create_by!(artist: artist11)
user13.favorites.find_or_create_by!(artist: artist10)



# サークル参加（他人のサークルに参加した例）
GroupMembership.find_or_create_by!(group: group1, user: user2)
GroupMembership.find_or_create_by!(group: group2, user: user5)
GroupMembership.find_or_create_by!(group: group3, user: user1)
GroupMembership.find_or_create_by!(group: group4, user: user8)
GroupMembership.find_or_create_by!(group: group5, user: user3)
GroupMembership.find_or_create_by!(group: group6, user: user6)
GroupMembership.find_or_create_by!(group: group7, user: user9)
GroupMembership.find_or_create_by!(group: group8, user: user10)
GroupMembership.find_or_create_by!(group: group2, user: user7)
GroupMembership.find_or_create_by!(group: group3, user: user4)
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