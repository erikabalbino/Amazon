class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@amazon.io'
  layout 'mailer'
end
