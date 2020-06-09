class AddCoisasToCreator < ActiveRecord::Migration[5.0]
  def change
    creators = Creator.where(twitter: nil)
    unless creators.nil?
      creators.update_all twitter: ''
    end

    creators = Creator.where(twitch: nil)
    unless creators.nil?
      creators.update_all twitter: ''
    end

    change_column :creators, :twitter, :string, default: ''
    change_column :creators, :twitch, :string, default: ''
  end
end
