namespace :rss_importer do
  desc "Import vnexpress rss"
  task vnexpress: :environment do
    RssCrawler.new('https://vnexpress.net/rss/thoi-su.rss').run
  end

  desc "Import huge rss events"
  task huge_events: :environment do
    Rsslink.rss_importer
  end
  
 
end
