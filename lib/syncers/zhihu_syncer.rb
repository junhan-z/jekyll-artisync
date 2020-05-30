require_relative 'per_node_syncer'
require 'nokogiri'


class ZhihuSyncer < PerNodeSyncer
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

end
