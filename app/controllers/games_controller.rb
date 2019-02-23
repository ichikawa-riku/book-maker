class GamesController < ApplicationController
  def index
    @games = Game.all.order('closed_at DESC').page(params[:page]).per(10)
    @now = Time.current
  end
  def new
    @game = Game.new
    @game.players.build
    @odds_select = {}
    for num in 1..10 do
      @odds_select[num.to_s] = num
    end
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to root_path
  end

private
  def game_params
    params.require(:game).permit(:title, :detail, :closed_at, players_attributes: [:name, :odds])
  end

end
