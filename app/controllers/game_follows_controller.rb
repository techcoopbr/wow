class GameFollowsController < ApplicationController
  def create
    @follow = current_user.followed_games.build(game_id: params[:game_id])

    if @follow.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @follow = @game.followers.find_by(user_id: current_user.id)

    if @follow.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
