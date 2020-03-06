class GamesController < ApplicationController
  require 'json'
  before_action :set_game, only: [:edit, :show, :destroy]

  def index
    @games = Game.geocoded
    if params[:filter]
      array = params.require(:filter).require(:sports)
      array.reject! {|string| string == ""}
      @games = @games.where(sport: array)
    end
    if params[:address]
        # Game.reindex
        @games = @games.search_by_address(params[:address])
        # like geocoded but for search kick result
        @games.to_a.reject! { |g| g.latitude.nil? || g.longitude.nil?}
    end
    if params[:hidden_filter]
      @games = @games.where(sport: params[:hidden_filter].split(" "))
    end
    @markers = @games.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { game: game }),
        image_url: helpers.asset_url('football-marker.png')
      }
      end
  end

  def show
    @booking = Booking.new
    @marker =
    [{
      lat: @game.latitude,
      lng: @game.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { game: @game }),
      image_url: helpers.asset_url('football-marker.png')
    }]
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
