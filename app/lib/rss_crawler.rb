require 'rss'
require 'open-uri'

class RssCrawler
  def initialize(url)
    @url = url
  end

  def run
    open(@url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        puts "Item: #{item.title}"
        Event.create(title: item.title, source: item.link, date: Date.today)
      end 
    end
  end
end