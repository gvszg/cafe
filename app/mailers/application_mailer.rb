class ApplicationMailer < ActionMailer::Base
  default from: "from@cafe.com"
  layout 'mailer'
end
