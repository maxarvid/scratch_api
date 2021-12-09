class Api::GamesController < ApplicationController
  def index
    games = Game.all
    if games.any?
      render json: { games: games }, status: 200
    else
      render json: { message: 'There are no games in the database.' }, status: 404
    end
  end

  def create
    games_array = ScraperService.fetch_and_format_html
    games = ScraperService.save_games_to_db(games_array)

    render json: { games: games }, status: 201
  end
end
