class WelcomeController < ApplicationController
  def index
    @you_are_home = true
    # cookies[:carousel_index] = 0
    # projects to be listen in projects section
    @projects = Post.where(section: "projects").reverse
  end
  
  def show_project_image
    @image = Post.find_by_id params[:id]
  end
  
  def close_dialog
  end
  
  def projects_dialog
    @project = params[:project]
    if @project.include? "project"
      @project = Post.find_by_tag(@project)
      @project_images = Post.where(project: @project)
    end
  end
  
  def services_dialog
    @service = params[:service]
  end
  
  def scroll_to_top
  end
  
  def focus_to_section
    @section_id = params[:section_id]
    @close_menu = params[:close_menu]
  end
end
