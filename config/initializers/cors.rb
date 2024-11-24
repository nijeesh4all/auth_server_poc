Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'
    resource '/oauth/token', headers: :any, methods: [:post, :options]
  end
end
