Rails.application.config.middleware.use OmniAuth::Builder do
  google = Rails.application.credentials.google
  provider :google_oauth2, google[:client_id], google[:client_secret]
end
