module PostsHelper
  def author(post)
    post.user == current_user
  end
end
