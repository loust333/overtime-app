# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: 'lourenco.steve@outlook.com'
  layout 'mailer'
end
