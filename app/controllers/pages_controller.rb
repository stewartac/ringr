class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  require 'json'

  def home
    @games = Game.geocoded
    @markers = @games.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { game: game }),
        image_url: helpers.asset_url(set_markers(game))
      }
      end
  end
end
