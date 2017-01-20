# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do 
		guilds= Guild.create(name: Faker::Company.name, description: Faker::Lorem.paragraph)
	

	
		comments= Comment.create(text: Faker::Lorem.sentence, user_id:rand(20))
	
		
	
		users=User.create(name: Faker::Name.first_name ,password: "password", pic:":P", birthdate:Faker::Date.between_except(18.year.ago, 1.year.from_now, Date.today) )
	

	
		posts=Post.create(text:Faker::Lorem.sentence, user_id: rand(20))
	

	
		streams=Stream.create(streamer: Faker::Name.first_name)

		user_guilds = UserGuild.create(user_id: rand(20), guild_id: rand(20))
end


	