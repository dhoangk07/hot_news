require 'webdrivers'
require 'watir'

class YoutubeWatir
  def initialize
    @browser = Watir::Browser.new
  end

  def execute
    @browser.goto('https://www.youtube.com/feed/trending')
    @browser.elements(css: 'h3.title-and-badge').each do |element|
      Event.create(title: element.text, source: element.a.href, date: Date.today)
    end
    rescue => exception
    puts exception
  end
end
