class HomeController < ApplicationController
  def index
    list = Post.joins(:author, :comments).includes(:author, :comments).merge(Author.where(email: params[:email]))
    output = list.map do |i|
      {
        id: i.id,
        title: i.title,
        body: i.body,
        created_at: i.created_at,
        updated_at: i.updated_at,
        author_id: i.author.id,
        comments: i.comments.map do |c|
          {
            id: c.id,
            title: c.title,
            body: c.body,
            created_at: c.created_at,
            updated_at: c.updated_at
          }
        end
      }
    end
    render json: output
  end
end
