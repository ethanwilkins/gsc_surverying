module PostsHelper
  def post_text tag
    post = Post.find_by_tag(tag)
    if post and post.body.present?
      post.body.html_safe
    else
      nil
    end
  end
end
