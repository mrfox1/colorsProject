class Admin::CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'Новая категория!' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_mood)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
