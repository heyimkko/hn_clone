class Seeder
	def self.make
		User.create name: Faker::Name.name,
								email: Faker::Internet.email,
								password_hash: Faker::Internet.user_name

	end
	def self.post
		User.all.each do |user|
			3.times do |i|
				if i % 3 == 0
					user.posts.create(title: Faker::Lorem.words, 
													 url: Faker::Internet.url)
				else
					user.posts.create title: Faker::Lorem.words, 
													 url: Faker::Internet.url,
													 content: Faker::Lorem.paragraphs
				end
			end
		end
	end

	def self.post_comment
		Post.all.each do |post|
			5.times do 
				new_comment = post.comments.new content: Faker::Lorem.paragraph
				new_comment.user = User.all.sample
				new_comment.save
			end	
		end
	end

end


# 50.times do
# 	Seeder.make
# end

# Seeder.post

# Seeder.post_comment
