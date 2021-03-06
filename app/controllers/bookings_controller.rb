class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

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
      flash[:notice] = "Booking Requested for #{@game.date.strftime('%a %d %b')}"
      redirect_to user_path(current_user)
    else
      redirect_to games_path
    end
  end

  def update
    if booking_params[:status] == "accepted"
      @booking.update(booking_params)
      flash[:notice] = "Booking Accepted"
      redirect_to user_path(current_user)
    elsif booking_params[:status] == "rejected"
      flash[:alert] = "Booking Rejected"
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
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
