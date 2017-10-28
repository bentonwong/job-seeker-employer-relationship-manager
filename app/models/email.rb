require 'pry'

class Email < ApplicationRecord

  def self.receive_email(message)
    Email.create! subject: message.subject, body: message.multipart? ? message.text_part.body.decoded : message.body.decoded, from: message.from, to: message.to, date: message.date
  end
  
end
