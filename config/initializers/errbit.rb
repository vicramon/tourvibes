Airbrake.configure do |config|
  config.api_key = '1aa04a8fb53a0e0b8dbb49824d27cd8e'
  config.host    = 'errbitvic.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end
