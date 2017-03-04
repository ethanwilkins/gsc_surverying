module PostsHelper
  def justified_body item
    'justified_body_text' if item.body.size > 150
  end
  
  def section_options
    options = [["Tag content for a particular section...", nil],
      ["About Us", "about_us"],
      ["Services", "services"],
      ["Projects", "projects"],
      ["Clients", "clients"],
      ["Contact Us", "contact_us"]
    ]
  end
  
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
