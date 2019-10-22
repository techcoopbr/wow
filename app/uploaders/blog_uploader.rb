class BlogUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick
  #include Thumbkit::Adapters::CarrierWave

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :showimg do
     process resize_to_limit: [1200, 768]
  end

  # Thumb
  version :thumb do
     process resize_to_limit: [900, 600]
  end

  # Medium
  version :medium do
     process resize_to_limit: [230, 230]
  end

  # Tipos de extensão aceitas
  def extension_whitelist
     %w(jpg jpeg gif png)
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg png jpeg bmp zip pdf rar)
  end
end
