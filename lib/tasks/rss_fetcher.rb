desc "Import vnexpress events"
task vnexpress_fetcher: :environment do 
  RssCrawler.new('https://vnexpress.net/rss/thoi-su.rss').run
end
