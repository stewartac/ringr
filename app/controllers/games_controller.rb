class GamesController < ApplicationController

  before_action :set_game, only: [:edit, :show, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
   @game = Game.create(game_params)
   if @game.save
      redirect_to game_path(@game)
    else
      raise
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
