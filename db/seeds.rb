require 'faker'

Photo.all.each do |photo|
	photo.update(vote_count: rand(25..1000))
end

# 40.times do 
# 	User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
# end

# 100.times do
# 	Comment.create(user_id: rand(1..40), photo_id: rand(1..20), text: Faker::Lorem.sentence)
# end

# Comment.all.each do |c|
# 	c.update(vote_count: rand(100..500))
# end