class AddScriptToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :stream_embed, :string
    add_column :creators, :youtube_embed, :string
    add_column :creators, :twitter_embed, :string
    add_column :creators, :facebook_embed, :string
    add_column :creators, :instagram_embed, :string
  end
end
