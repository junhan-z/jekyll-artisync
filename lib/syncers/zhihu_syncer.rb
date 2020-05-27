require_relative 'abstract_syncer'
require 'nokogiri'


class ZhihuSyncer < AbstractSyncer
  def get_article_xpath
    '//div[contains(@class, "Post-RichText") and contains(@class, "ztext")]'
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

  def gen_html
    page_html = self._fetch_html
    article = Nokogiri::HTML(page_html).xpath(self.get_article_xpath)
    content = []
    article.children.each do |node|
      content.append self._handle_node(node)
    end

    content.join("\n")
  end

end
