# encoding: utf-8

class BgUploader < CarrierWave::Uploader::Base

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    storage :file
  end
  
  def public_id
    model.id
  end
end