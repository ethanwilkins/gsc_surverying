class WelcomeController < ApplicationController
  def index
    @you_are_home = true
    cookies[:carousel_index] = 0
  end
  
  def close_dialog
  end
  
  def services_dialog
    @service = params[:service].to_i
  end
  
  def scroll_to_top
  end
  
  def focus_to_section
    @section_id = params[:section_id]
    @close_menu = params[:close_menu]
  end
  
  def contact
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to root_url
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :organization, :work_phone, :home_phone, :fax, :email, :url, :comments)
  end
end
