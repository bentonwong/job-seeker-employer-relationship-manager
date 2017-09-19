require 'pry'

class Email < ApplicationRecord
  def self.receive_email(message)
    #use .match
    #regex: (?<=@).+($)
    #extracted_emails =[]
    #extracted_emails += message.to.first[/^(?=@).+($)/, 1]
    #extracted_emails += message.text_part.body.decoded[/^(?=@).+($)/, 1]
    Email.create! subject: message.subject, body: message.multipart? ? message.text_part.body.decoded : message.body.decoded, from: message.from, to: message.to, date: message.date

    #if email_id.present?
      #Email.update(email_id, body: message.body.decoded)
    #else
      #Email.create! subject: message.subject, body: message.text_part.body.decoded, from: message.from.first, to: message.to.first, date: message.date
    #end
  end
end
