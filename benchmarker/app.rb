require "benchmark"
require "open-uri"
require "csv"

path = ARGV[0]

authors = CSV.read("authors.csv", headers: true)

Benchmark.bm do |bench|
  bench.report do
    1.times do
      authors.each do |author|
        open("http://#{path}?email=#{author["email"]}") { |f| f.read.size }
      rescue OpenURI::HTTPError
        puts "No notes with ID #{num}"
      end
    end
  end
end
