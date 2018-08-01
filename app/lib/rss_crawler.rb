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
  rescue => exception
    puts exception
  end

end

# Feedjira gem

# class Feedjira::Parser::RSSEntry
#   element "google:elevation", as: :elevation
# end

# class RssCrawler
#   def initialize(url)
#     @url = url
#   end

#   def run
#         debugger
        
#         Feedjira::Feed.add_common_feed_entry_element('ht:news_item')
    # another solution
    #feed = Feedjira::Feed.fetch_and_parse(@url)
    # feed = Feedjira::Parser.json_feed_item(@url)
    # feed = Feedjira::Parser::GoogleDocsAtomEntry.element(@url)
#      xml = Faraday.get(@url).body
#     feed = Feedjira::Feed.parse xml

#     feed.entries.each do |entry|
#       puts "Item: #{entry.title}"
#       Event.create(title: entry.title, source: entry.url, date: Date.today)
#     end 
#     rescue => exception
#     puts exception
#   end
# end