require 'faker'

jbs = ["http://i1287.photobucket.com/albums/a640/alanflorendo/222780_977410035404_4949780_n_zps4e96fd59.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/47598_840072011904_5659089_n_zpsac6000c2.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/57898_801309237814_6572415_n_zps5f16bfbe.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/57898_801309053184_1325228_n_zps75acf85e.jpg", "http://i1287.photobucket.com/albums/a640/alanflorendo/66583_1531735266452_5118139_n_zpsc7b2a1f6.jpg"
]

jb_titles = ["buds", "serious", "shy", "class", "terpsichorean"]

adjs = %w(addicting afraid agreeable amused ancient angry annoyed anxious arrogant ashamed average awful bad beautiful better big bitter black blue boiling brave breezy brief bright broad broken bumpy calm careful charming cheerful chilly clumsy cold colossal combative comfortable confused cooing cool cooperative courageous crazy creepy cruel cuddly curly curved damp dangerous deafening dee defeated defiant delicious delightful depressed determined dirty disgusted disturbed dizzy dry dull dusty eager early elated embarrassed empty encouraging energetic enthusiastic envious evil excited exuberant faint fair faithful fantastic fast fat few fierce filthy fine flaky flat fluffy foolish forlorn frail frantic fresh friendly frightened funny fuzzy gentle giant gigantic goo gorgeous greasy great green grieving grubby grumpy handsome happy hard harsh healthy heavy helpful helpless high hilarious hissing hollow homeless horrible hot huge hungry hurt hushed husky icy ill immense itchy jealous jittery jolly juicy kind large late lazy light little lively lonely long loose loud lovely low lucky magnificen mammoth many massive melodic melted mighty miniature moaning modern mute mysterious narrow nasty naughty nervous nice nosy numerous nutty obedient obnoxious odd old orange ordinary outrageous panicky perfect petite plastic pleasant precious pretty prickly proud puny purple purring quaint quick quickest quiet rainy rapid rare raspy ratty red relieve repulsive resonant ripe roasted robust rotten rough round sad salty scary scattered scrawny screeching selfish shaggy shaky shallow sharp shivering short shrill silent silky silly skinny slimy slippery slow small smart smiling smooth soft solid sore sour spicy splendid spotty square squealing stale steady steep sticky stingy straight strange striped strong stupendous successful sweet swift tall tame tan tart tasteless tasty tender tender tense terrible testy thirsty thoughtful thoughtless thundering tight tiny tired tough tricky troubled ugliest ugly uneven upset uptight vast victorious vivacious voiceless wasteful watery weak weary wet whispering wicked wide wide-eyed witty wonderful wooden worried x-ray yellow young yummy zan)

nouns = %w(time year people way day man thing woman life child world school state family student group country problem hand part place case week company system program question work government number night Mr point home water room mother area money storey fact month lot right study book eye job word business issue side kind head house service friend father power hour game line end member law car city community name president team minute idea kid body information back parent face others level office door health person art war history party result change morning reason research girl guy food moment air teacher)


40.times do
  uname = "#{adjs[rand(adjs.length-1)]}_#{nouns[rand(nouns.length-1)]}"
  User.create(email: Faker::Internet.email, username: uname, password: "password")
end

40.times do
  	index = rand(5)
    Photo.create(title: jb_titles[index], url: jbs[index], user_id: User.all.sample.id)
end

#each user goes thru each photo; 1-4 chance the user will vote on the photo
User.all.each do |user|
  Photo.all.each do |p|
    odds = rand(1..4)
    Vote.create(user_id: user.id, votable_id: p.id, votable_type: "Photo") if odds == 1
    p.update(vote_count: p.vote_count+1)  if odds == 1
  end
end

#each user goes thru each photo; 1-3 chance the user will comment on the photo
User.all.each do |user|
  Photo.all.each do |p|
    odds = rand(1..3)
    Comment.create(user_id: user.id, photo_id: p.id, text: Faker::Lorem.sentence) if odds == 1
  end
end

#each user goes thru each comment; 1-6 chance the user will vote on the comment
User.all.each do |user|
  Comment.all.each do |c|
    odds = rand(1..6)
    Vote.create(user_id: user.id, votable_id: c.id, votable_type: "Comment") if odds == 1
    c.update(vote_count: c.vote_count+1) if odds == 1
  end
end

