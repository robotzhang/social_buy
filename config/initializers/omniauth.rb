Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :weibo, "3095732433", "a9ce25c48fd330401cb31e18d875ae38"
end