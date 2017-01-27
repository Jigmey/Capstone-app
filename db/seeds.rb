# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


4.times do 
		guilds= Guild.create(name: Faker::Pokemon.name, description: Faker::Lorem.paragraph)
			
	
		users=User.create(name: Faker::Name.first_name ,password: "password", pic:"https://yt3.ggpht.com/-s0zQiUR0MOw/AAAAAAAAAAI/AAAAAAAAAAA/Q3aqAskH2wg/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", birthdate:Faker::Date.between_except(18.year.ago, 1.year.from_now, Date.today) )
	
end

	