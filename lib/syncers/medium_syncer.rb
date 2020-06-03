require_relative 'per_node_syncer'
require 'nokogiri'


class MediumSyncer < PerNodeSyncer
  def get_article_xpath
    '//article/div/section/div/div'
  end

  # override
  def get_article_nodes
    page_html = self._fetch_html
    article = Nokogiri::HTML(page_html).xpath(self.get_article_xpath)

    # Medium embeds Author section, which is not needed for article
    article.children[1..]
  end

  def _handle_node(node)
    case node.name
    when "figure"
      img_nodes = node.css('img')
      node = img_nodes[-1] if img_nodes
      # to make sure image scales right
      node.remove_attribute('width')
      node.remove_attribute('height')
    end
    node.to_html
  end

end
