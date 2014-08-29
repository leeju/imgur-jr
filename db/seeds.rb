require 'faker'

5.times do
  User.create(email: Faker::Internet.email, password: "password")
end

jbs = ["http://i1287.photobucket.com/albums/a640/alanflorendo/222780_977410035404_4949780_n_zps4e96fd59.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/47598_840072011904_5659089_n_zpsac6000c2.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/57898_801309237814_6572415_n_zps5f16bfbe.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/57898_801309053184_1325228_n_zps75acf85e.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/66583_1531735266452_5118139_n_zpsc7b2a1f6.jpg"
]

jb_titles = ["buds", "serious", "shy", "class", "terpsichorean"]

User.all.each do |user|
  10.times do
  	index = rand(5)
    user.photos << Photo.create(title: jb_titles[index], url: jbs[index])
  end
end
