Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :weibo, "3373872336", "61c1cad771b81df57ae88034dc9bb830", :client_options => {:ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s}}
end