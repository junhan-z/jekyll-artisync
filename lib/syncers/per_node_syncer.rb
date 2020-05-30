require_relative 'abstract_syncer'
require 'nokogiri'


class PerNodeSyncer < AbstractSyncer

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
