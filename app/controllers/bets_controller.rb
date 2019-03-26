class BetsController < ApplicationController
  before_action :set_game
  def new
    @players = Player.where(game_id: params[:game_id])
    @bet = Bet.new
  end

  def create
    @bet = @game.bets.new(bet_params)
    @bet.save
    redirect_to root_path
  end

private
  def bet_params
    params.require(:bet).permit(:player_id, :points).merge(user_id: current_user.id)
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

end
