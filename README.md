# Benchmark Examples

This is just a collection of tests for myself to see how frameworks I know compare for performance, at least in the way that I know how to build them. If you have suggestions on how performance could be improved in a realistic way, feel free to submit a PR. Though we may differ on what is considered "realistic"

## Updated Results

```
                    user     system      total        real
ASP.NET Core MVC    1.139721   0.675669   1.815390 ( 15.862574)
Sinatra             0.833938   0.740033   1.573971 ( 23.041624)
Express             0.908309   0.661417   1.569726 ( 35.781817)
Symfony             1.035906   0.585410   1.621316 ( 42.420679)
Rails               1.006100   0.606241   1.612341 ( 81.408431)
```

## To run

Use the `benchmarker` app to run against the host you have the web app running on.

    ruby app.rb localhost:8000

## Notes

* I was actually expecting Sinatra and Sequel to do a lot better. I must be missing something, but it was harder to work with associations in Sequel than I thought it would be. (Update: Yes, I am doing something wrong.)
* Sequelize did surprisingly well. I was able to learn a bit more about its available options from VS Code IntelliSense than from the documentation. I should learn more about it.
* I'm disappointed PHP didn't do better. I should try it on a Linux VM and see if it does better.
* It isn't really surprising, but Entity Framework was probably the most difficult to configure to work with an existing database. My attempts to use standard property names and configration/annotations to map the correct field failed. I also found VS Code to be less convenient for C# development tooling than the full Visual Studio IDE. I always forget the connection string format:

    ```
    "DefaultConnection": "server=mysql;port=3306;database=weblog_dev;uid=root;password=secret;sslmode=None"
    ```
