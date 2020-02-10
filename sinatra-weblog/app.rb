require "sequel"
require "sinatra"
require "sinatra/json"
require "json"
require "logger"

connection = File.read(".env").strip
DB = Sequel.connect(connection)
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
  author = Author.where(email: params[:email]).first
  posts = Post.where(author_id: author.id).all
  puts posts.size
  comments = Comment.where(post_id: posts.map(&:id)).all
  puts comments.size
  output = posts.map do |i|
    {
      id: i.id,
      title: i.title,
      body: i.body,
      created_at: i.created_at,
      updated_at: i.updated_at,
      author_id: i.author_id,
      comments: comments.select { |c| c.post_id == i.id }.map do |c|
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
  json output
end
