Flexirest::Base.base_url = ENV.fetch("ZENDESK_API_URL")
Flexirest::Base.username = Rails.application.credentials.zendesk_api[:username]
Flexirest::Base.password = Rails.application.credentials.zendesk_api[:password]