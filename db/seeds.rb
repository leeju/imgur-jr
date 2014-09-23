require 'faker'

def adj_noun_comment
	adjs = %w(Awesome Cool Super Great Good Nice Smooth Jacked Rockin Great Cool Super)
	nouns = %w(pic shot view job photo picture lighting setting pic shot photo picture)
	puncts = ["", ".", ".", "!"]
	adj = adjs[rand(adjs.length)]
	noun = nouns[rand(nouns.length)]
	punct = puncts[rand(puncts.length)]
	return "#{adj} #{noun}#{punct}"
end

def word_comment
	comments = %w(Awesome Cool Hilarious Beautiful Nice)
	return comments[rand(comments.length)]
end

def sentence_comment
	comments = ["I love this", "This is awesome", "This is hilarious", "Absolutely perfect", "Very Interesting", "Subtle image"]
	puncts = ["", ".", ".", "!", ".", ".", "!!", ".", ".", "!!!"]
	punct = puncts[rand(puncts.length)]
	return "#{comments[rand(comments.length)]}#{punct}"
end

def create_comment
	comment_type = rand(4)
	return adj_noun_comment if comment_type == 0 || comment_type == 1
	return word_comment if comment_type == 2
	return sentence_comment if comment_type == 3
end
Photo.all.each do |photo|
	photo.update(vote_count: rand(500..2500))
end

50.times do 
	User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

100.times do
	Comment.create(user_id: rand(1..40), photo_id: Photo.all.sample.id, text: create_comment)
end

Comment.all.each do |c|
	c.update(vote_count: rand(100..500))
end