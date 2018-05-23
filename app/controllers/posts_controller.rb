class PostsController < ApplicationController
  before_action :current_user?, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :author?, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.newest
    @categories = Category.all
    @tags = Tag.all
  end

  def show
    @post.increment!(:views)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
       flash.now[:success] = 'Пост успешно создан! Уииии'
       format.html { redirect_to @post }
       Post.create_tags(params[:post][:tags], @post)
      else
        flash.now[:danger] = 'Что-то пошло не так'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash.now[:success] = 'Пост успешно обновлен'
        format.html { redirect_to @post }
        format.json { render :show, status: :ok, location: @post }
      else
        flash.now[:danger] = 'Что-то пошло не так'
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        flash.now[:success] = 'Пост успешно удален(('
        format.html { redirect_to root_path }
        format.json { head :no_content }
      else
        flash.now[:danger] = 'Что-то пошло не так'
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
