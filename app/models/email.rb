class Email < ApplicationRecord
  def self.receive_email(message)
    #regex (?<=@)[^.]+ to parse the domain
    #use .match
    email_id = message.subject[/^Update (\d+)$/, 1]
    extracted_email_domains = []
    extracted_email_domains.push(message.from[(?<=@)[^.]+, 1])
    extracted_email_domains.push(message.to[(?<=@)[^.]+, 1])
    extracted_email_domains.push(message.body[(?<=@)[^.]+, 1])

    if email_id.present?
      Email.update(email_id, body: message.body.decoded)
    else
      Email.create! subject: message.subject, body: message.text_part.body.decoded, from: message.from.first, to: message.from.first, date: message.date
    end
  end
end
