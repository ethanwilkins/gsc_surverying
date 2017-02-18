class ContactMailer < ApplicationMailer
  def contact_email contact
    mail to: contact.email,
      subject: contact.name,
      body: contact.comments
  end
end
