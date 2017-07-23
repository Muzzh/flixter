# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.fog_provider = :aws
  config.aws_bucket   = ENV["AWS_BUCKET"]                        # required
  config.aws_acl      = "public-read"

  config.aws_credentials = {
    access_key_id:     ENV["AWS_ACCESS_KEY"],
    secret_access_key: ENV["AWS_SECRET_KEY"],
    region:            ENV["AWS_REGION"]
  }
end