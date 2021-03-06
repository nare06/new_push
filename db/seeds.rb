# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create([{name: "Entrepreneurship", image_url: "fa-users"},
	            {name: "Music", image_url: "fa-music"},
	            {name: "Sports", image_url: "fa-soccer-ball-o"},
	            {name: "Robotics", image_url: "fa-android"},
	            {name: "Dance", image_url: "fa-pied-piper-alt"},
	            {name: "Debates", image_url: "fa-bullhorn"},
	            {name: "Social Meetups", image_url: "fa-beer"},
	            {name: "Fashion", image_url: "fa-foursquare"},
	            {name: "Photography", image_url: "fa-camera-retro"},
	            {name: "Politics", image_url: "fa-bomb"},
	            {name: "Food", image_url: "fa-cutlery"},
	            {name: "Films", image_url: "fa-film"},
	            {name: "Gaming", image_url: "fa-gamepad"},
	            {name: "Web Development", image_url: "fa-cubes"},
	            {name: "Travel", image_url: "fa-plane"},
	            {name: "Arts", image_url: "fa-paint-brush"},
	            {name: "Business", image_url: "fa-usd"}])
Domain.create([{name: "Workshops", image_url: "fa-cogs"},
				{name: "Seminars", image_url: "fa-users"},
				{name: "Conferences", image_url: "fa-sitemap"},
				{name: "Quizzes", image_url: "fa-trophy"},
				{name: "Online Competitions", image_url: "fa-keyboard-o"},
				{name: "Presentations", image_url: "fa-slideshare"},
				{name: "Alumni Meetups", image_url: "fa-graduation-cap"},
				{name: "Fests", image_url: "fa-magic"}])
Eligible.create([{name: "Only B.Tech"},{name: "Only M.Tech"},{name: "Only MBA grads"},{name: "Post Grads"},{name: "College Faculty"}])
Reach.create([{name: "Campus Event"},{name: "Hall Event"}])
Campus.create([{name: "Indian Institute of Technology Kharagpur", short_name: "iitkgp"},{name: "Indian Institute of Technology Madras", short_name: "iitm"},
	          {name: "Manipal University", short_name: "mu"}])
Role.create(name: "superadmin")
a= User.new(name: "AdminUser",email: "firstuser@test.com", role:"user",campus_id: "1",password: "11111111", password_confirmation: "11111111")
a.skip_confirmation!
a.save
a.roles << Role.first 
if Rails.env.development?
(1..100).each do |i|
	a = Time.now + rand(10..100).days
	b = a + rand(2..5).days
a = Event.create(title: "Test #{i} Event", organizer: "Test #{i} Event",venue: "Test #{i} Event", sdatetime: a, edatetime: b,
	         contact_name: "Test #{i} Event", contact_phone: "888405678#{rand(1..9)}", email: "test#{rand(1..9)}@test.com",
	         events_description: "<p>Test #{i} Event</p>", short_description: "Test #{i} Event", campus_id: rand(1..3), user_id: 1,
	         reach_id: rand(1..2))
a.categories << [Category.find(rand(1..7)), Category.find(rand(8..14))]
a.domains << Domain.find(rand(1..7))
a.eligibles << Eligible.find(rand(1..5))
a.update_column(:workflow_state, "accept")
end

(1..25).each do |i|
 Group.create(name: "Music Society #{i}", short_name: "ETMS#{i}", contact_name: "Test #{i}", 
	         contact_phone: "888456730#{rand(1..9)}", email: "group#{i}@test.com", campus_id: rand(1..3))
end
end