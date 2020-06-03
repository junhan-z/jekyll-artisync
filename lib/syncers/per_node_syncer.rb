require_relative 'abstract_syncer'
require 'nokogiri'


class PerNodeSyncer < AbstractSyncer

  def get_article_nodes
    page_html = self._fetch_html
    article = Nokogiri::HTML(page_html).xpath(self.get_article_xpath)
    article.children
  end

  def gen_html
    article_nodes = self.get_article_nodes
    content = []
    article_nodes.each do |node|
      content.append self._handle_node(node)
    end

    content.join("\n")
  end

end
