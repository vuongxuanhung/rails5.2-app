Rails.application.routes.default_url_options[:host] =
  case Rails.env
  when 'development'
    'http://localhost:3000'
  else
    ENV['DOMAIN_URL']
  end
