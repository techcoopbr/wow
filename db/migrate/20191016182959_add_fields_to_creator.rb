class AddFieldsToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :contact_address, :string
    add_column :creators, :contact_email, :string
    add_column :creators, :contact_phone, :string
    add_column :creators, :contact_file, :string
    add_column :creators, :short_description, :string
    add_column :creators, :publi_file, :string
  end
end
