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
        img_url = node['data-actualsrc']
        img_url['/v2'] = '/80/v2'
        img_url = img_url.gsub(/_[a-zA-Z]\.jpg/, '_720w.jpg') # _[a-z].jpg -> _720.jpg
        node['src'] = img_url
      end
    end

    node.to_html
  end

end
