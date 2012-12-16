CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AMAZON_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AMAZON_ACCESS_KEY']
  }
  config.fog_directory  = "dispatcher-#{Rails.env}"
end
