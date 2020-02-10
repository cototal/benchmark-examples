# Benchmark Examples

This is just a collection of tests for myself to see how frameworks I know compare for performance, at least in the way that I know how to build them. If you have suggestions on how performance could be improved in a realistic way, feel free to submit a PR. Though we may differ on what is considered "realistic"

## Results from benchmarker

Language | Framework | ORM | Result
C# | ASP.NET Core MVC | Entity Framework | 23.23s
PHP | Symfony | Doctrine | 70.89s
JavaScript | Express | Sequelize | 31.28s
Ruby | Rails | ActiveRecord | 78.85s
Ruby | Sinatra | Sequel | 68.87s

## Surprises

* I was actually expecting Sinatra and Sequel to do a lot better. I must be missing something, but it was harder to work with associations in Sequel than I thought it would be.
* Sequelize did surprisingly well. I was able to learn a bit more about its available options from VS Code IntelliSense than from the documentation. I should learn more about it.
* I'm disappointed PHP didn't do better. I should try it on a Linux VM and see if it does better.
