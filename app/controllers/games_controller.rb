class GamesController < ApplicationController
  require 'json'
  before_action :set_game, only: [:edit, :show, :destroy]

  def index
    # raise
    @games = Game.geocoded
    @user = User.geocoded
    if params[:filter]
      array = params.require(:filter).require(:sports)
      array.reject! {|string| string == ""}
      @games = @games.where(sport:array)
    elsif params[:filter2]
      # raise
      sports = params.require(:filter2).gsub("[", "").gsub("]","").gsub('"','').gsub(" ","").split(",")
      @games = @games.where(sport:sports)
    # elsif params[:hidden_filter]
    #   @games = @games.where(sport: params[:hidden_filter].split(" "))
    end

    @addresses = @games.pluck(:address)
    if params[:address].present?
      @games = @games.search_by_address(params[:address])
      @games.to_a.reject! { |g| g.latitude.nil? || g.longitude.nil?}
    end
    @markers = @games.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { game: game }),
        image_url: helpers.asset_url(set_markers(game)),
        id: game.id
      }
      end
    if params[:sort_by] == "distance"
      @games = @games.sort_by{|game| game.distance_from_user(current_user)}
    elsif params[:sort_by] == "time"
      @games = @games.sort_by{|game| game.time}
    end

  end

  def show
    @booking = Booking.new
    @marker =
    [{
      lat: @game.latitude,
      lng: @game.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { game: @game }),
      image_url: helpers.asset_url(set_markers(@game))
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
    redirect_to root_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:address, :date, :time, :price, :format, :sport, :available_spaces)
  end

  def set_markers(game)
   placeholder = ''
   if game.sport == "Football"
    placeholder = 'football-marker.png'
   elsif game.sport == "Basketball"
    placeholder = 'basketball-marker.png'
   elsif game.sport == "Netball"
    placeholder = 'netball-marker.png'
   elsif game.sport == 'Rugby'
    placeholder = 'rugby-marker.png'
   elsif game.sport == "Cricket"
    placeholder = 'cricket-marker.png'
   elsif game.sport == "Hockey"
    placeholder = 'hockey-marker.png'
    end
  end
end
