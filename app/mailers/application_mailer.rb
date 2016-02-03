class ApplicationMailer < ActionMailer::Base
  default from: "Jambandu App <noreply@jambandu.com>"
  default to: "inbox@jambandu.com"
  append_view_path Rails.root.join('app', 'views', 'mailers')
end