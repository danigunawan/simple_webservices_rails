5.times do #5 kali data insert 
	Article.create({
			title: Faker::Book.title,
			body: Faker::Lorem.sentence
	})
end