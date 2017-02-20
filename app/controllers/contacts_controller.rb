class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(seen: nil)
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver
      redirect_to root_url
    end
  end
  
  def destroy_all
    Contact.all.destroy_all
    redirect_to :back
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :organization, :work_phone, :home_phone, :fax, :email, :url, :comments)
  end
end
