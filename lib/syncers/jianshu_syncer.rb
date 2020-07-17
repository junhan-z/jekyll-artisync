require_relative 'per_node_syncer'
require 'nokogiri'


class JianshuSyncer < PerNodeSyncer
  def get_article_xpath
    '//article'
  end

  def _handle_node(node)
    case node.name
    when 'div'
      img_node = node.css('img')[-1]
      if img_node
        node = img_node
        # jianshu.com uses a //<url> style, therefore 
        # append an 'https' in front of '//' part to 
        # make it a valid image url.
        node['src'] = 'https:' + node['data-original-src']
      end
    end

    node.to_html
  end

end
