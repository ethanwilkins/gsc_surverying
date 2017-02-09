module PostsHelper
  def post_img tag
    post = Post.find_by_tag tag
    if post and post.image.present?
      post.image
    else
      nil
    end
  end
  
  def post_text tag
    post = Post.find_by_tag(tag)
    if post and post.body.present?
      post.body.html_safe
    else
      nil
    end
  end
end
