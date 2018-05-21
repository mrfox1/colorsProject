class ProfilesController < ApplicationController
  before_action :set_user, only: :show
  before_action :require_user
  before_action :set_profile

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Ваш профиль успешно обновлен' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_profile
    @profile = @user.profile
  end

  def require_user
    redirect_to root_path unless @user == current_user
  end
end
