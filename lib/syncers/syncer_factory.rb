require_relative 'zhihu_syncer'


ZHIHU_ZHUANLAN = 'zhuanlan.zhihu.com'

class SyncerFactory
  def self.get_syncer(uri)
    host_name = uri.host

    case host_name
    when ZHIHU_ZHUANLAN
      return ZhihuSyncer.new(uri)
    else
      raise "Not supported website for host: #{host_name}"
    end
  end
end
