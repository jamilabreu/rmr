CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',                         # required
    :aws_access_key_id      => 'AKIAIX5ZZUOHNIJ66TQQ',        # required
    :aws_secret_access_key  => '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',     # required
    :region                 => 'us-east-1'                    # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'repmyride'                                   # required
  config.fog_host       = 'https://s3.amazonaws.com/repmyride'          # optional, defaults to nil
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end