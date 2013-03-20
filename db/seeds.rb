
require 'faker'

15.times do 
  Post.create   :body     => Faker::Lorem.paragraph,
                :author   => Faker::Name.name,
                :email    => Faker::Internet.email,
                :title    => Faker::Lorem.word
                # :tags     => Tag.create(:name => 'sports')
end


