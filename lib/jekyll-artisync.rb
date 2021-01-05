require 'syncers/syncer_factory'


class ArticleSyncEmbed < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def render(context)
    url = Liquid::Template.parse(@content).render(context).strip
    uri = URI(url)
    syncer = SyncerFactory.get_syncer(uri)
    return syncer.gen_html
  end

  Liquid::Template.register_tag "artisync", self

end
