require_relative 'jianshu_syncer'
require_relative 'zhihu_syncer'
require_relative 'weixin_syncer'
require_relative 'medium_syncer'
require_relative 'csdn_syncer'


CSDN = 'blog.csdn.net'
JIANSHU = 'www.jianshu.com'
MEDIUM = 'medium.com'
WEIXIN = 'mp.weixin.qq.com'
ZHIHU_ZHUANLAN = 'zhuanlan.zhihu.com'


class SyncerFactory
  def self.get_syncer(uri)
    host_name = uri.host

    case host_name
    when CSDN
      return CSDNSyncer.new(uri)

    when JIANSHU
      return JianshuSyncer.new(uri)

    when MEDIUM
      return MediumSyncer.new(uri)

    when WEIXIN
      return WeixinSyncer.new(uri)

    when ZHIHU_ZHUANLAN
      return ZhihuSyncer.new(uri)

    else
      raise "Not supported website for host: #{host_name}"
    end
  end
end

