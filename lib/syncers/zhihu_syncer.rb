require_relative 'per_node_syncer'
require 'nokogiri'


class ZhihuSyncer < PerNodeSyncer
  def get_article_xpath
    '//div[contains(@class, "Post-RichText") and contains(@class, "ztext")]'
  end

  def _handle_node(node)
    case node.name
    when 'figure'
      img_node = nil
      nodes = node.children
      while nodes.length > 0
        n = nodes.pop
        if not img_node and n.name == 'img'
          img_node = n
          img_node['src'] = img_node['data-actualsrc']
        end
      end
      node = img_node
    end

    if node then node.to_html else '' end
  end

end
