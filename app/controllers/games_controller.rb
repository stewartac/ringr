class GamesController < ApplicationController

  before_action :set_game, only: [:edit, :show, :destroy]

  def index
    @games = Game.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @team = Team.find(params[:team_id])
    @game = Game.new
  end

  def edit
  end

  def create
    @team = Team.find(params[:team_id])
    @game = Game.new(game_params)
    @game.team = @team
    if @game.save
      redirect_to game_path(@game)
    else
      # raise
      render :new
    end
  end

  def destroy
    @game.destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:address, :date, :time, :price, :format, :sport, :available_spaces)
  end

end
