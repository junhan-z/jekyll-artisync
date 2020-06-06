require_relative 'per_node_syncer'
require 'nokogiri'


class CSDNSyncer < PerNodeSyncer
  def get_article_xpath
    '//div[contains(@id, "content_views")]'
  end

  def _handle_node(node)
    node.to_html
  end

end
