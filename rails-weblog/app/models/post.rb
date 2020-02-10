class Post < ApplicationRecord
  belongs_to :author
  has_many :comments

  def self.seed
    Author.seed
    if Post.count > 0
      return
    end
    Author.find_each do |author|
      50.times do
        author.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(number: 3).join("\n"))
      end
    end
  end
end
