# logHorizon_blog

Powered by [Rails](https://github.com/rails/rails), [Slim](http://slim-lang.com) and [Semantic-UI](https://github.com/Semantic-Org/Semantic-UI), build with love. Follows [Semantic Version 2.0.0](http://semver.org/). Inspired by [LogHorizon](http://www3.nhk.or.jp/anime/loghorizon/)

[logHorizon是什么?](https://github.com/wall2flower/logHorizon_blog/wiki)

## Demo
My Blog: [wall2flower的生存报告](http://blog.wall2flower.me)

## Testing
before this command, make sure you have already installed capybara and [capybara-webkit](https://github.com/thoughtbot/capybara-webkit).
btw, capybara-webkit need QT dependency, you can click [here](https://github.com/thoughtbot/capybara-webkit#qt-dependency-and-installation-issues) to find some tips.
```
bundle exec rspec spec
```

## Installation
1.clone this repo

```
git clone https://github.com/wall2flower/logHorizon_blog.git
cd logHorizon
```

2.copy database config file and modified with your own config

```
cp config/database.example config/database.yml
vi config/database.yml
```

3.`bundle install` to install requirement gem

4.run migration

```
bundle exec rake db:create db:migrate
```

5.create admin account
```
rake init:generate_admin
```

<img src="/doc/img/example-02.png" />

6.run server

```
rails s
```

### Usage
you can `cp config/application.example config/application.yml` and edit `config/application.yml`, to set blog title, user avater etc.
```
title: # here is blog title
subtitle: # subtitle
personal_desc: # personal description
avater_url: # avater url
```

when you hava installed application successfully, visit `/admin/users/sign_in` to login, and then you can post/edit articles.

<img src="/doc/img/example-01.png" />

###TODO:
- [ ] React.js/RactiveJS
- [ ] 彩蛋: 深夜食堂

## Thanks
- [Semantic-UI](https://github.com/Semantic-Org/Semantic-UI)
- [typo.css](https://github.com/sofish/typo.css)

# License
The MIT License (MIT)

Copyright (c) 2015 wall2flower

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
