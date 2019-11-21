CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID_IAM'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_IAM'],
      region: ENV['AWS_S3_REGION']
    }
    config.fog_directory  = ENV['UPLOAD_S3_BUCKET']
    config.fog_public     = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.asset_host = ENV['ASSET_HOST']
  end

  config.store_dir = "#{Rails.env}/uploads"
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
