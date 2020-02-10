require "sequel"
require "sinatra"
require "json"
require "logger"

connection = File.read(".env").strip
DB = Sequel.connect(connection, loggers: [Logger.new($stdout)])
class Author < Sequel::Model
  one_to_many :posts
end

class Post < Sequel::Model
  one_to_many :comments
  many_to_one :author
end

class Comment < Sequel::Model
  many_to_one :post
end

get "/" do
  content_type "application/json"
  author = Author.where(email: params[:email]).first
  return Author.where(email: params[:email]).methods.to_json
  posts = Post.eager(:comments).join(Author).where(Sequel.lit(Author.where(email: params[:email]).to_sql)).all
  output = posts.map do |i|
    {
      id: i.id,
      title: i.title,
      body: i.body,
      created_at: i.created_at,
      updated_at: i.updated_at,
      author_id: i.author_id,
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
  .to_json
end
