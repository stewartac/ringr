class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]
  after_save :update_game_available_spaces, on: update

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @game = Game.find(params[:game_id])
    @booking = Booking.new(status: 'requested')
    @booking.user = current_user
    @booking.game = @game
    if @booking.save
      redirect_to user_path(current_user)
    else
      redirect_to games_path
    end
  end

  def update
      if booking_params[:status] == "accepted"
        @booking.update(booking_params)
        update_booking_available_spaces
      elsif
        @booking.update(booking_params)
      end
        redirect_to user_path(current_user)
  end

  def update_game_available_spaces
      @game = Game.find(params[:game_id])
      @game.available_spaces = @game.available_spaces - 1
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end

end
