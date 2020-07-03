class CreatorFollowsController < ApplicationController

  def create
    @follow = current_user.followed_creators.build(creator_id: params[:creator_id])

    @follow.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @creator = Creator.find(params[:creator_id])
    @follow = @creator.followers.find_by(user_id: current_user.id)

    @follow.destroy

    respond_to do |format|
      format.js
    end
  end
end
