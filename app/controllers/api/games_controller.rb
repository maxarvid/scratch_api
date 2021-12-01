class Api::GamesController < ApplicationController
  def index
    games = Game.all
    render json: { games: games }, status: 200
  end
end
