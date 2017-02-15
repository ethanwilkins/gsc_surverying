class WelcomeController < ApplicationController
  def index
    @you_are_home = true
    cookies[:carousel_index] = 0
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
  end
end
