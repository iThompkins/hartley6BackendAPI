ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'https://suspicious-mahavira-fd689f.netlify.com/',
  user_name: Rails.application.credentials.SENDGRID_USERNAME,
  password: Rails.application.credentials.SENDGRID_PASSWORD,
  authentication: :login,
  enable_starttls_auto: true
}