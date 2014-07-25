# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "Entrepreneurship", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Music")
Category.create(name: "Sports")
Category.create(name: "Robotics", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Dance", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Debates", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Web Development", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Fashion", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Photography", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Business", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Politics", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Food", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Films", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Gaming", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Travel", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Category.create(name: "Arts", image_url: "http://2.bp.blogspot.com/-H6MAoWN-UIE/TuRwLbHRSWI/AAAAAAAABBk/89iiEulVsyg/s400/Free%2BNature%2BPhoto.jpg")
Domain.create(name: "Workshops")
Domain.create(name: "Seminars")
Domain.create(name: "Conferences")
Domain.create(name: "Quizzes")
Domain.create(name: "Online Competitions")
Domain.create(name: "Board Meetings")
Domain.create(name: "Alumni Meetups")
Eligible.create(name: "Only B.Tech")
Eligible.create(name: "Only M.Tech")
Eligible.create(name: "Only MBA grads")
Eligible.create(name: "Post Grads")
Eligible.create(name: "College Faculty")
(1..9).each do |i|
Event.create(title: "Test #{i} Event", organizer: "Test #{i} Event", sdatetime: Time.now + 5.days, edatetime: Time.now + 10.days,
	         contact_name: "Test #{i} Event", contact_phone: "888405678#{rand(1..9)}", email: "test#{rand(1..9)}@test.com",
	         events_description: "<p>Test #{i} Event</p>", short_description: "Test #{i} Event", campus_id: rand(1..3), user_id: 2,
	         reach_id: rand(1..2))
end