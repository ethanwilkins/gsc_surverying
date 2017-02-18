class ContactMailer < ApplicationMailer
  default to: 'ethanforrestwilkins@gmail.com'
  
  def contact_email contact
    mail from: contact.email,
      subject: contact.name,
      body: contact.comments
  end
end
