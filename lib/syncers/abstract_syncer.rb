require 'net/http'


# user agent is necessary otherwise certain sites such as Zhihu throws 400
USER_AGENT = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36'

MESSAGE = "AbstractSyncer::[%s]: override required."

class AbstractSyncer
  def initialize(uri)
    @uri = uri
  end

  def _fetch_html
    uri = @uri
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
      # :use_ssl => true for the uri is https
      http.request(Net::HTTP::Get.new(uri, {'User-Agent' => USER_AGENT}))
    end

    res.body
  end

  def get_article_xpath
    raise MESSAGE % [__method__]
  end

  def get_article_nodes
    raise MESSAGE % [__method__]
  end

  def gen_html
    raise MESSAGE % [__method__]
  end
end
