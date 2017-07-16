class PostsController < ApplicationController
  before_action :set_post, only: [:update]
  before_action :secure_user
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.section = params[:section]
    if @post.save
      flash[:notice] = "New content created successfully."
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def edit
    if params[:id]
      @post = Post.find_by_id params[:id]
    elsif params[:tag]
      @post = Post.where(tag: params[:tag]).last
    end
    if params[:tag] and not @post
      @post = Post.new body: "[placeholder text]", tag: params[:tag]
      @post.project = params[:project] if params[:project]
      @post.section = params[:section] if params[:section]
    # for showing certain field in form
    elsif @post and @post.tag
      @tag = @post.tag      
    end
    @editing = true unless @post.new_record?
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "You have successfully updated content."
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def destroy
    @post = Post.find_by_id params[:id]
    @post.destroy
    redirect_to :back
  end
  
  private
  
  def secure_user
    unless current_user
      redirect_to '/404'
    end
  end
  
  def set_post
    @post = Post.find params[:id]
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :image, :tag, :section, :project, :url)
  end
end
