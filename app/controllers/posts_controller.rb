class PostsController < ApplicationController
  before_action :current_user?, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :author?, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    @categories = Category.all
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
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Пост успешно обновлен' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html { redirect_to root_path, notice: 'Пост успешно удален((' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image, :category_id)
  end

  def current_user?
    redirect_to root_path unless current_user.present?
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def author?
    redirect_to root_path unless @post.user == current_user
  end
end
