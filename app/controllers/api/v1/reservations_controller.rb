# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < ApplicationController
      def create
        reservation = Reservation.new(create_params)
        guest = reservation.guest
        restaurant = reservation.table.restaurant
        if reservation.save!
          RestaurantNotifierMailer.send_order_placed_email(guest)
          GuestNotifierMailer.send_order_placed_email(restaurant)
          render json: { msg: 'The reservation is successfully made', code: 200 }
        else
          render json: { errors: reservation.errors }, status: :unprocessable_entity
        end
      end

      def update
        reservation = Reservation.where(id: params[:id]).first
        old_reservation_time = reservation.reservation_time
        old_guest_count = reservation.guest_count
        guest_email = reservation.guest.email
        new_reservation = reservation.update(reservation_time: params[:reservation_time], guest_count: params[:guest_count] )
        if GuestNotifierMailer.send_order_updated_email(reservation, new_reservation)
          render json: { msg: 'The reservation is successfully updated', code: 200 }
        else
          render json: { errors: new_reservation.errors }, status: :unprocessable_entity
        end 
      end
        
      def show
        restaurant = Restaurant.where(id: params[:id])
        tables = restaurant.first.tables.select(:id,:name)
        reservation_details = Reservation.where(table_id: tables.ids)
        rest_data = reservation_details.select(:table_id, :reservation_time,:guest_count)
        if rest_data
          render json: { data: rest_data, code: 200 }
        else
          render json: { errors: rest_data.errors }, status: :unprocessable_entity
        end
      end

      private 

      def create_params
        params.permit(
          :reservation_time,
          :table_id,
          :shift_id,
          :guest_id,
          :guest_count
          )
      end  
    end 
  end
end