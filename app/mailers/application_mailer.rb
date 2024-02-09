# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'brighteventsexample@outlook.com'
  layout 'mailer'
end
