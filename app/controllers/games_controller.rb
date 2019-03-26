class GamesController < ApplicationController

  def index
    @games = Game.incoming.order('closed_at ASC').page(params[:page]).per(10)
    @points = Point.where(user_id: current_user.id).order("created_at DESC")
    @balance = Point.where(user_id: current_user.id).sum(:point)
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
    binding.pry
    @game = Game.new(game_params)
    @game.save
    redirect_to root_path
  end

private
  def game_params
    params.require(:game).permit(:title, :detail, :closed_at, players_attributes: [:name, :odds]).merge(owner_attributes: {user_id: current_user.id,})
  end

end
