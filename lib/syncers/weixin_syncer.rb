require_relative 'per_node_syncer'
require 'nokogiri'


class WeixinSyncer < PerNodeSyncer
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

end
