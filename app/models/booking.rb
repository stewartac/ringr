class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user



  def update_game_spaces
      @booking = Booking.find(params[:id])
      @game = Game.find(params[:id])
      @game.update_attributes[available_spaces: :available_spaces - 1]
  end
end
