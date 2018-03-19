namespace :rss_importer do
  desc "Import vnexpress rss"
  task vnexpress: :environment do
    RssCrawler.new('https://vnexpress.net/rss/thoi-su.rss').run
  end

  desc "Import vnexpress_xe events"
  task vnexpress_xe: :environment do
    RssCrawler.new('https://vnexpress.net/rss/oto-xe-may.rss').run
  end

  desc "Import vnexpress_cuoi events"
  task vnexpress_cuoi: :environment do
    RssCrawler.new('https://vnexpress.net/rss/cuoi.rss').run
  end

  desc "Import tienphong events"
  task tienphong: :environment do
    RssCrawler.new('https://www.tienphong.vn/rss/xa-hoi-phong-su-13.rss').run
  end

  desc "Import nytimes events"
  task nytimes: :environment do
    RssCrawler.new('http://rss.nytimes.com/services/xml/rss/nyt/Baseball.xml').run
  end
end
