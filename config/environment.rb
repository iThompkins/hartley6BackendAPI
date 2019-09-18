# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.delivery_method = :smtp
# SMTP settings for gmail
config.action_mailer.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => Rails.application.credentials.gmail_username,
 :password             => Rails.application.credentials.gmail_password,
 :authentication       => "plain",
:enable_starttls_auto => true
}

