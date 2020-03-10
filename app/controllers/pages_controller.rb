class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  require 'json'

  def home
    @games = Game.geocoded
    @markers = @games.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        image_url: helpers.asset_url(set_markers(game))
      }
      end
  end

  private

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
