require_relative 'per_node_syncer'
require 'nokogiri'


class ZhihuSyncer < PerNodeSyncer
  def get_article_xpath
    '//div[contains(@class, "Post-RichText") and contains(@class, "ztext")]'
  end

  def _handle_node(node)
    if node.child and node.child["class"] == 'ztext-math'
      # write this line to your generated html for mathjax support:
      # <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
      # for example, you can include it in your template file: _layouts/post.html
      node.content = '$$' + node.content + '$$'
    end

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
