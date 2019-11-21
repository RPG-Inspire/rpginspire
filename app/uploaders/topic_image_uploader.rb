class TopicImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  def store_dir
    "#{super}/#{model.class.to_s.underscore}/#{mounted_as}/#{model_folder}"
  end

  def model_folder
    secret = [ENV['CARRIERWAVE_SALT'], model.id].join('/')
    Digest::SHA256.hexdigest(secret)
  end

  def extension_whitelist
    %w(jpg jpeg gif png webm webp)
  end

  def convert_file_ext(file_name, new_ext)
    extension = File.extname(file_name)
    base_name = file_name.chomp(extension)
    "#{base_name}.#{new_ext}"
  end

  version :cover do
    process fill_sides: [660]
    process resize_to_limit: [660, nil]

    version :original do
      process :convert_to_webp

      def full_filename(for_file)
        convert_file_ext(super(for_file), 'webp')
      end
    end

    version :fallback do
      process convert: :jpg
      process quality: 85

      def full_filename(for_file)
        convert_file_ext(super(for_file), 'jpg')
      end
    end

  end

  version :card_preview do
    process fill_sides: [538]
    process resize_to_limit: [538, nil]

    version :original do
      process :convert_to_webp

      def full_filename(for_file)
        convert_file_ext(super(for_file), 'webp')
      end
    end

    version :fallback do
      process convert: :jpg
      process quality: 85

      def full_filename(for_file)
        convert_file_ext(super(for_file), 'jpg')
      end
    end
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def convert_to_webp(quality = 85)
    manipulate! do |img|
      img.format 'webp'
      img.combine_options do |c|
        c.quality quality
      end
      img
    end
  end

  def fill_sides(w, background_color = '#fff')
    current_path = self.file.file
    image = MiniMagick::Image.open(current_path)
    if (image.width < w)
      image.combine_options do |c|
        c.extent("#{w}x#{image.height}")
        c.gravity('center')
        c.background(background_color)
      end
      image.write(current_path)
    end
  end
end

