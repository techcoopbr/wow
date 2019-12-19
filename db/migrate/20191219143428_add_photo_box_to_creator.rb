class AddPhotoBoxToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :photo_box, :string
  end
end
