require 'multi_xml'
require 'open-uri'

class ParseNewsJob < ActiveJob::Base
  queue_as :default

  def perform(channel)
    file_parse = MultiXml.parse(open(channel))
    file_parse['rss']['channel']['item'].each do |item|
      category = Category.find_or_create_by(title: item['category'])
      article  = Article.find_or_create_by(
          title:       item['title'],
          link:        item['link'],
          description: item['description'],
          pubDate:     item['pubDate'],
          image:       item['enclosure'].present? ? item['enclosure']['url'] : nil,
      )
      category.articles << article
    end
  end

end
