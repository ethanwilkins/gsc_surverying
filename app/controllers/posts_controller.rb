class PostsController < ApplicationController
  before_action :set_post, only: [:update]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_url
    else
      redirect_to :back
    end
  end
  
  def edit
    @post = Post.find_by_tag params[:tag]
    unless @post
      @post = Post.create body: "[placeholder text]", tag: params[:tag]
    end
    @editing = true
  end
  
  def update
    if @post.update(post_params)
      redirect_to root_url
    else
      redirect_to :back
    end
  end
  
  def carousel_scroll
    @carousel_size = 4
    @direction = params[:direction]
    # steps up and down carousel_index
    cookies[:carousel_index] = if @direction.to_sym.eql? :right
      cookies[:carousel_index] = cookies[:carousel_index].to_i + 1
    elsif @direction.to_sym.eql? :left
      cookies[:carousel_index] = cookies[:carousel_index].to_i - 1
    end
    # keeps within limits
    if cookies[:carousel_index].to_i > Post.all.size - @carousel_size
      cookies[:carousel_index] = 0
    elsif cookies[:carousel_index].to_i < 0
      cookies[:carousel_index] = Post.all.size - @carousel_size
    end
    # gets images
    @images = Post.limit(@carousel_size).offset(cookies[:carousel_index].to_i)
    # carousel image to insert with ids
    if @direction == "right"
      @image = @images.last
      @point_to_add = "last"
      @point_to_remove ="first"
    elsif @direction == "left"
      @image = @images.first
      @point_to_add = "first"
      @point_to_remove = "last"
    end
  end
  
  private
  
  def set_post
    @post = Post.find params[:id]
  end
  
  def post_params
    params.require(:post).permit(:body, :image, :tag)
  end
end
