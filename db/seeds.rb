require 'faker'

5.times do
  User.create(email: Faker::Internet.email, password: "password")
end

User.all.each do |user|
  10.times do
    user.photos << Photo.create(title: "puppy", url: "http://dogtowndogtraining.com/wp-content/uploads/2012/06/300x300-061-e1340955308953.jpg")
  end
end
