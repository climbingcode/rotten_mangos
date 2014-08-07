# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'tomjdavis27@gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            'tomjdavis27',
  password:             'rdync47mec',
  authentication:       'plain',
  enable_starttls_auto: true  }


require 'carrierwave/orm/activerecord'

require 'pry'