namespace :rss_importer do
  desc "Import vnexpress rss"
  task vnexpress: :environment do
    RssCrawler.new('https://vnexpress.net/rss/thoi-su.rss').run
  end
end
