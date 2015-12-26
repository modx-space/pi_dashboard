# Raspberry Dashboard


**`Description:`**
#### This project is for monitoring Raspberry Pi. And it helps on the following things:

+ **monitor and show machine temperature**
+ **monitor and show disk usage**
+ **monitor and show running services**

**`Technology:`**
#### This project is built by using the following main things:

+ **[Ruby][1]**
+ **[Sinatra][2]**
+ **[Clockwork][3]**

more details, please see Gemfile.

[1]: https://www.ruby-lang.org/
[2]: http://www.sinatrarb.com/
[3]: https://github.com/tomykaira/clockwork

**`Usage:`**

+ **local development**

```
1. clone the code
2. bundle install
3. foreman start
```

+ **Raspberry deployment**

```
1. clone the code
2. bundle install
3. clockworkd -c clock.rb -d . --log-dir=./log --pid-dir=./tmp/pids --log start
4. puma -C puma.rb
```
