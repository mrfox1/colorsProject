class PostsController < ApplicationController
  before_action :current_user?, only: [:new, :create]

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
    params.require(:post).permit(:title, :text, :image, :category_id)
  end

  def current_user?
    redirect_to root_path unless current_user.present?
  end
end
