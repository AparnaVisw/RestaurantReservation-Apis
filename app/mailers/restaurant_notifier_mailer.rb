class RestaurantNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  def send_order_placed_email(guest)
    @guest = guest
    mail( :to => @guest.email,
    :subject => 'Order placed' )
  end
end
