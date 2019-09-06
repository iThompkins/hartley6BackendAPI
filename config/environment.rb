# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.credentials.SENDGRID_USERNAME,
  :password => Rails.application.credentials.SENDGRID_PASSWORD,
  :domain => 'https://suspicious-mahavira-fd689f.netlify.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

