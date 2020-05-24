require 'net/http'
require 'nokogiri'

require "jekyll"

# user agent is necessary otherwise certain sites such as Zhihu throws 400
USER_AGENT = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36'

HOST_TO_ARTICLE_XPATH = {
  'zhuanlan.zhihu.com' => '//div[contains(@class, "Post-RichText") and contains(@class, "ztext")]',
}

class ArticleSyncEmbed < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def _fetch_html(uri)
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
      # :use_ssl => true for the uri is https
      http.request(Net::HTTP::Get.new(uri, {'User-Agent' => USER_AGENT}))
    end

    res.body
  end

  def _handle_node(node)
    case node.name
    when 'figure'
      img_node = node.children[1]

      img_url = img_node['data-actualsrc']
      img_url['_b.jpg'] = '_720w.jpg'
      img_url['/v2'] = "/80/v2"

      img_node['src'] = img_url
    end
    node.to_html
  end

  def render(context)
    url = @content.strip
    uri = URI(url)
    page_host = uri.hostname
    puts page_host
    page_html = self._fetch_html(uri)
    article = Nokogiri::HTML(page_html).xpath(HOST_TO_ARTICLE_XPATH[page_host])
    content = []
    article.children.each do |node|
      content.append self._handle_node(node)
    end

    content.join("\n")
  end

  Liquid::Template.register_tag "artisync", self

end
