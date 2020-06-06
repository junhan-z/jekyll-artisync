require_relative 'zhihu_syncer'
require_relative 'weixin_syncer'
require_relative 'medium_syncer'
require_relative 'csdn_syncer'


ZHIHU_ZHUANLAN = 'zhuanlan.zhihu.com'
WEIXIN = 'mp.weixin.qq.com'
MEDIUM = 'medium.com'
CSDN = 'blog.csdn.net'

class SyncerFactory
  def self.get_syncer(uri)
    host_name = uri.host

    case host_name
    when ZHIHU_ZHUANLAN
      return ZhihuSyncer.new(uri)
    when WEIXIN
      return WeixinSyncer.new(uri)
    when MEDIUM
      return MediumSyncer.new(uri)
    when CSDN
      return CSDNSyncer.new(uri)
    else
      raise "Not supported website for host: #{host_name}"
    end
  end
end

