require 'net/http'
require 'nokogiri'

require "jekyll"

class ArticleSyncEmbed < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def render(context)
  end

  Liquid::Template.register_tag "artisync", self

end
