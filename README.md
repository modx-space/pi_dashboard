Raspberry Dashboard
---

#### This project is for monitoring Raspberry Pi, and it supports the following things:
+ **monitor and show machine temperature**
+ **monitor and show disk usage**
+ **monitor and show running services**

#### This project is built by using the following main things:
+ **[Ruby][1]**
+ **[Sinatra][2]**
+ **[Clockwork][3]**

> more details, please see Gemfile.

[1]: https://www.ruby-lang.org/
[2]: http://www.sinatrarb.com/
[3]: https://github.com/tomykaira/clockwork

#### Usage:
+ **local development**

  ```
  1. clone the code
  2. bundle install
  3. foreman start
  ```

+ **Raspberry deployment**

  ```
  cap staging deploy
  ```

#### UI:
+ ![Home Page](/public/assets/images/homepage.png)

+ ![Temperature Page](/public/assets/images/temperature_analysis.png)

+ ![Storage Page](/public/assets/images/storage_analysis.png)

+ ![Service Page](/public/assets/images/service.png)
