class PagesController < ApplicationController
  def show
    render params[:title]
  end
end
