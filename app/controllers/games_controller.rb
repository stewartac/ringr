class GamesController < ApplicationController

  before_action :set_game, only: [:edit, :show, :destroy]

  def index

    if params[:address].blank? && params[:filter].blank?
        @games = Game.all
        @games = @games.geocoded
    elsif params[:filter]
      array = params.require(:filter).require(:sports)
      array.reject! {|string| string == ""}
      @games = Game.where(sport: array)
    else
        search = params[:address].presence || "*"
        conditions = {}
        conditions[:address] = params[:address] if params[:address].present?
        conditions[:sport] = params[:sport] if params[:sport].present?
        @games = Game.search search, where: conditions, aggs: [:address,:sport]
        # like geocoded but for search kick result
        @games.to_a.reject! { |g| g.latitude.nil? || g.longitude.nil?}
    end
    @markers = @games.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { game: game }),
        image_url: helpers.asset_url('football-marker')
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
      image_url: helpers.asset_url('football-marker')
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
