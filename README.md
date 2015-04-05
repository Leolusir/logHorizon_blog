# logHorizon_blog

Powered by [Rails](https://github.com/rails/rails) and [Semantic-UI](https://github.com/Semantic-Org/Semantic-UI), build with love. Follows [Semantic Version 2.0.0](http://semver.org/). Inspired by [LogHorizon](http://www3.nhk.or.jp/anime/loghorizon/)

## Testing
```
bundle exec rspec spec
```

## Install
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

3.create database with PostgreSQL or MySQL

4.`bundle install` to install requirement gem

5.run server

```
rails s
```

###TODO:
- [ ] React.js/RactiveJS
- [ ] 彩蛋: 深夜食堂

###DONE:
- [x] archived by date
- [x] sqlite -> postgresql
- [x] admin scope
- [x] pagination
- [x] post/edit/delete blogs
- [x] post blog with tags
- [x] markdown syntax
- [x] rewrite template with [Slim](http://slim-lang.com/)

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
