class Email < ApplicationRecord
  def self.receive_email(message)
    email_id = message.subject[/^Update (\d+)$/, 1]
    if email_id.present?
      Email.update(email_id, body: message.body.decoded)
    else
      Email.create! subject: message.subject, body: message.body.decoded, from: message.from.first, to: message.from.first, date: message.date
    end
  end
end
