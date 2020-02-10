class Comment < ApplicationRecord
  belongs_to :post

  def self.seed
    Post.seed
    if Comment.count > 0
      return
    end
    Post.find_each do |post|
      10.times do
        post.comments.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(number: 2).join("\n"))
      end
    end
  end
end
