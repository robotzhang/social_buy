Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :weibo, APP_CONFIG["weibo_id"], APP_CONFIG["weibo_secret"], :client_options => {:ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s}}
end