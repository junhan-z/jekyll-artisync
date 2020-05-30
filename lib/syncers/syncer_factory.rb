require_relative 'zhihu_syncer'
require_relative 'weixin_syncer'


ZHIHU_ZHUANLAN = 'zhuanlan.zhihu.com'
WEIXIN = 'mp.weixin.qq.com'

class SyncerFactory
  def self.get_syncer(uri)
    host_name = uri.host

    case host_name
    when ZHIHU_ZHUANLAN
      return ZhihuSyncer.new(uri)
    when WEIXIN
      return WeixinSyncer.new(uri)
    else
      raise "Not supported website for host: #{host_name}"
    end
  end
end

