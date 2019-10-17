class AddWhileToCreator < ActiveRecord::Migration[5.0]
  def change
    @creators = Creator.all

    @creators.each do |e|
      user = User.find(e.user_id)

      e.photo       = user.photo
      e.facebook    = user.facebook
      e.twitter     = user.twitter
      e.twitch      = user.twitch
      e.website     = user.website
      e.podcast     = user.podcast
      e.page_name   = user.page_name
      e.page_create = user.page_create
      e.youtube     = user.youtube
      e.instagram   = user.intagram
      e.save!
    end

  end
end
