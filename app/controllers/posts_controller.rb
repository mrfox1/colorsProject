class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.category_id = 1
    respond_to do |format|
      if @post.save
       format.html { redirect_to @post, notice: 'Пост успешно создан! Уииии' }
      else
        format.html { render :new }
      end
    end
  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end
end
