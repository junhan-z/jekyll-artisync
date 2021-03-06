# jekyll-artisync

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE.txt)
[![Gem Version](https://img.shields.io/gem/v/jekyll-artisync.svg)][ruby-gems]

[ruby-gems]: https://rubygems.org/gems/jekyll-artisync

Jekyll Plugin to sync articles from other sites.
A [simple demo site](https://jekyll-artisync-demosite.herokuapp.com/) showing how it works.

## Introduction
**jekyll-artisync** is a customized [Liquid](https://shopify.github.io/liquid/) template tag to fetch an article from a given URL and feed as the content of your Jekyll site post.

## Why built it
Jekyll is awesome, don't get me wrong.

I just found writing Markdown in Vim is not enjoyable, especially when I need to
write Chinese sometimes (Vim key bindings doesn't work while use Chinese input). Besides, writing Jekyll post is local. 
It will be nice to sync from a post that I write online with a WYSIWYG editor, while I maintain the independence of my personal site.

## General idea
* Fetch the content of a given URL
* Locate the post body
* Feed it into Jekyll content

Therefore using a customized Liquid tag seems is the best solution.

## Installation
Add this line to your Gemfile:
```ruby
group :jekyll_plugins do
  ...
  gem "jekyll-artisync"
end
```
And then execute:
```
$ bundle install
```

## How to use it
* Create a normal post under `_posts` directory, for example `2020-05-20-foo-bar-post.md` with your favorite template in front matter
* As for content, apply the tag with supported url. For example, `{% artisync https://zhuanlan.zhihu.com/p/<post id> %}` will be sufficient
* Run `jekyll s` in terminal and wait for Jekyll to build the site and run the server
* Go to `localhost:<port>` (default port is 4000), you should be able to see the article fetched and displayed
* Deploy your change to your website host

## Syntax and Support List
`{% artisync <your post url> %}`

Or add the url in your front matter and reference it in Liquid, such as:
```
---
...
post_url: <your post url>

---
```

`{% artisync {{page.post_url}} %}`
 

Here is a list of current supported hosts:
| Hosts                            |
|:-:                               |
| `https://blog.csdn.net`          |
| `https://www.jianshu.com`        |
| `https://medium.com`             |
| `https://mp.weixin.qq.com`       |
| `https://zhuanlan.zhihu.com`     |

## Next Steps
Please refer to issues of this repo.
