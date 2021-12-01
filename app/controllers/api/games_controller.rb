class Api::GamesController < ApplicationController
  def index
    games = Game.all
    if games.any?
      render json: { games: games }, status: 200
    else
      render json: { message: 'There are no games in the database.' }, status: 404
    end
  end
end
