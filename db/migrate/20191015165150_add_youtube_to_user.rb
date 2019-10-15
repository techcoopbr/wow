class AddYoutubeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :youtube, :string
    add_column :users, :intagram, :string
  end
end
