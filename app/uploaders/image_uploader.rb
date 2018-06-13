class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [300, 300]

  version :item_thumb do
    process resize_to_fit: [208, 200]
  end

  version :user_thumb do
    process resize_to_fit: [90, 90]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
