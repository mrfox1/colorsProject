class CategoriesController < ApplicationController
  before_action :require_user, only: :new

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Категория успешно создана' }
      end
    else
      redirect_to :back
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_mood)
  end

  def require_user
    if current_user.present? && current_user.role == 'admin'
      true
    else
      redirect_to root_path
    end
  end
end
