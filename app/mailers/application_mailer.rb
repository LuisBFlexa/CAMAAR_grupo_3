# frozen_string_literal: true

# Base mailer class for the application.
# Sets the default sender email and layout for all mailers.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
