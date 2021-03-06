class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [450, 450]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
