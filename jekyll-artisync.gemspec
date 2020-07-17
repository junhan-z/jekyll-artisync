
Gem::Specification.new do |spec|
  spec.name          = "jekyll-artisync"
  spec.version       = 0.9
  spec.authors       = ["Junhan Zhu"]
  spec.email         = ["junhanoct@gmail.com"]

  spec.summary       = %q{Jekyll Plugin to sync articles from other sites.}
  spec.description   = %q{Take an article from a given site and display on current Jekyll page.}
  spec.homepage      = "https://github.com/junhan-z/jekyll-artisync"
  spec.license       = "MIT"

  spec.files         = Dir["lib/jekyll-artisync.rb"] + Dir["lib/syncers/*"]

  spec.add_dependency "nokogiri", "~> 1.10"

end
