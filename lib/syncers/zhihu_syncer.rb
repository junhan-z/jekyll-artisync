require_relative 'per_node_syncer'
require 'nokogiri'


class ZhihuSyncer < PerNodeSyncer
  def get_article_xpath
    '//div[contains(@class, "Post-RichText") and contains(@class, "ztext")]'
  end

  def _handle_node(node)
    case node.name
    when 'figure'
      img_node = node.css('img')[-1]
      if img_node
        node = img_node
        node['src'] = node['data-actualsrc']
      end
    end

    node.to_html
  end

end
