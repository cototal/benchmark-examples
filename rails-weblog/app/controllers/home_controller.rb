class HomeController < ApplicationController
  def index
    @list = Post.joins(:author).includes(:comments).merge(Author.where(email: params[:email]))
    render json: @list
  end
end
