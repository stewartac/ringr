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
      flash[:success] = "Booking NOW Requested"
      redirect_to user_path(current_user)
    else
      redirect_to games_path
    end
  end

  def update
    if @booking.update(booking_params)
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
