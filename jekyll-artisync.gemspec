require 'rake'


Gem::Specification.new do |spec|
  spec.name          = "jekyll-artisync"
  spec.version       = 0.6
  spec.authors       = ["Junhan"]
  spec.email         = ["junhanoct@gmail.com"]

  spec.summary       = %q{Jekyll Plugin to sync articles from other sites.}
  spec.description   = %q{Take an article from a given site and display on current Jekyll page.}
  spec.homepage      = "https://github.com/junhan-z/jekyll-artisync"
  spec.license       = "MIT"

  spec.files         = FileList["lib/jekyll-artisync.rb", "lib/syncers/*"].to_a

  spec.add_dependency "nokogiri", "~> 1.10"

end
