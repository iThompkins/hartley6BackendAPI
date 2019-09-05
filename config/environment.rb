# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'MikeHartley6',
  :password => 'foobar661',
  :domain => 'https://suspicious-mahavira-fd689f.netlify.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

config.action_mailer.default_url_options = { host: 'https://suspicious-mahavira-fd689f.netlify.com/' }