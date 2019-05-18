class PictureUploader < SecureUploader
  process :store_meta

  version :thumbnail do
    process resize_to_fit: [nil, 256]
  end



  def store_meta
    if file.present? && model.present?
      image = ::MiniMagick::Image.open(file.file)
      model.width, model.height = image[:dimensions]
      model.size = image.size
    end
  end
end
