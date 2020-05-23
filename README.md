# jekyll-artisync
[![Gem Version](https://img.shields.io/gem/v/jekyll-artisync.svg)][ruby-gems]

[ruby-gems]: https://rubygems.org/gems/jekyll-artisync

Jekyll Plugin to sync articles from other sites.
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
* Create a normal post under `_post` directory, for example `2020-05-20-foo-bar-post.md` with your favorite template in front matter
* As for content `{% artisync https://zhuanlan.zhihu.com/p/<post id> zhihu %}` will be sufficient
* Run `jekyll s` and go to `localhost:4000`, you should be able to see the article fetched and displayed

## Syntax and Support List
`{% artisync url site-identifier %}`

`url`: the URL of your post  
`site-identifier`: the identifier for your site, in above example, `zhihu` is used to get the xpath of the content body

Here is a list of current supported sites:
| URL                                     | site identifier  | 
|:-:                                      |:-:               |
| `https://zhuanlan.zhihu.com/p/post-id`    |  zhihu           |

## Next Steps
Please refer to issues of this repo.
