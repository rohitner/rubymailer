# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

# import database
data = File.read('database.txt').split("\n")

# parameters
from = Email.new(email: 'rohitner@tesla.com')
subject = 'Sendgrid Subject'
message = File.read('message.txt')
content = Content.new(type: 'text/plain', value: message)

# setup API
sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

# mass mailing!
data.each do |id|
  to = Email.new(email: id)
  mail = Mail.new(from, subject, to, content)
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end
