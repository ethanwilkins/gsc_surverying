class WelcomeController < ApplicationController
  def index
    @you_are_home = true
    # cookies[:carousel_index] = 0
    # projects to be listen in projects section
    @projects = Post.where(section: "projects").reverse
  end
  
  def close_dialog
  end
  
  def services_dialog
    @service = params[:service].to_i
    if params[:service].include? "project"
      @images = Post.where(project: params[:service]).reverse
    end
  end
  
  def scroll_to_top
  end
  
  def focus_to_section
    @section_id = params[:section_id]
    @close_menu = params[:close_menu]
  end
end
