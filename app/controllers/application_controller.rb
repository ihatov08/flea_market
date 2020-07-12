class ApplicationController < ActionController::Base
  def categories
    @categories ||= Category.order(:id)
  end

  helper_method :categories
end
