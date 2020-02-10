class Author < ApplicationRecord
  has_many :posts

  def self.seed
    if Author.count > 0
      return
    end
    500.times do |author|
      Author.create(name: Faker::Name.name, email: Faker::Internet.email)
    end
  end
end
