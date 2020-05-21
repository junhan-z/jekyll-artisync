require 'net/http'
require 'nokogiri'

require "jekyll"

# user agent is necessary otherwise certain sites such as Zhihu throws 400
USER_AGENT = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36'

SITE_TO_ARTICLE_XPATH = {
  'zhihu' => '//div[contains(@class, "Post-RichText") and contains(@class, "ztext")]',
}

class ArticleSyncEmbed < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def _fetch_html(url)
    uri = URI(url)
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
      # :use_ssl => true for the uri is https
      http.request(Net::HTTP::Get.new(uri, {'User-Agent' => USER_AGENT}))
    end

    res.body
  end

  def _get_xpath(xpath_type)

  end

  def _fetch_article(article_xpath)
    article_html = _fetch_html()

    xpath = @content.xpath
    article_doc = Nokogiri::HTML(article_html)

    article_node = article_doc.xpath(article_xpath)
    content = []
    article_node.children.each do |node|
      content.append node.to_html
    end

  end

  def render(context)
    url, site = @content.strip.split
    page_html = self._fetch_html(url)
    article = Nokogiri::HTML(page_html).xpath(SITE_TO_ARTICLE_XPATH[site])
    content = []
    article.children.each do |node|
      content.append node.to_html
    end

    content.join("\n")
  end

  Liquid::Template.register_tag "artisync", self

end
