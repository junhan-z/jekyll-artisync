require_relative 'abstract_syncer'
require 'nokogiri'


class WeixinSyncer < AbstractSyncer
  def get_article_xpath
    '//div[contains(@class, "rich_media_content") and contains(@id, "js_content")]'
  end

  def _handle_node(node)
    node.children.each do |child_node|
      case child_node.name
      when 'img'
        child_node['src'] = child_node['data-src']
        child_node['data-src'] = nil
      end
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
