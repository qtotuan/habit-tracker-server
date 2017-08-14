class ApplicationController < ActionController::API
  def index
    @categories = Category.all
    render json: @categories
  end
end
