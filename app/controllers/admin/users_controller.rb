class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, except: :index

  def index
    @users = User.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash.now[:success] = 'Роль пользователя успешно обновлена'
        format.html { redirect_to admin_users_path }
      else
        flash.now[:danger] = 'Не вышло!'
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
