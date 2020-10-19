#create 10 guests
if Guest.count.zero?
	10.times do |x|
	  Guest.create({name: "name-#{x}", email: "email#{x}@testemail.com"})
	end
end

if Restaurant.count.zero?
	2.times do |x|
	  restaurant = Restaurant.create({name: "restaurantname-#{x}", email: "restemail_#{x}@testemail.com", phone: "900-909-0987"})
	  Shift.create(shift_start_time: Time.now, shift_end_time: Time.now + 4.hours, restaurant_id: restaurant.id )
	  Shift.create(shift_start_time: Time.now + 8.hours, shift_end_time: Time.now + 12.hours, restaurant_id: restaurant.id )
	  2.times do |t|
	  	table = Table.create({name: "table-#{t}", guest_min_no: 2, guest_max_no: 5, restaurant_id: restaurant.id})
	  end
	end
end

