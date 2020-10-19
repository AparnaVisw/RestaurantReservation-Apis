class GuestNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  def send_order_placed_email(restaurant)
    @restaurant = restaurant
    mail( :to => @restaurant.email,
    :subject => 'Order placed' )
  end

  def send_order_updated_email(old,newemail,email)
  	@old = old
  	@new = newemail
  	@email = email
  	debugger
  	mail( :to => @email,
    :subject => 'Order updated' )
  end
end
