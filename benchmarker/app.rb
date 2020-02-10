require "benchmark"
require "open-uri"
require "csv"

paths = [
  "localhost:5000", # asp.net mvc
  "localhost:6001", # sinatra
  "localhost:4000", # express
  "localhost:8000", # symfony
  "localhost:3000", # rails
]

authors = CSV.read("authors.csv", headers: true)

Benchmark.bm do |bench|
  paths.each do |path|
    bench.report(path) do
      3.times do
        authors.each do |author|
          open("http://#{path}?email=#{author["email"]}") { |f| f.read.size }
        rescue OpenURI::HTTPError
          puts "No notes with ID #{num}"
        end
      end
    end
  end
end
