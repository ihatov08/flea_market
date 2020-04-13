class HomeController < ApplicationController
  def index
    @categories = Category.order(:id)
  end
end
