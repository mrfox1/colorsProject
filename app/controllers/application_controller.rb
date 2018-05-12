class ApplicationController < ActionController::Base
  def find_category
    Category.find(params[:id]).name
  end

  helper_method :find_category
end
