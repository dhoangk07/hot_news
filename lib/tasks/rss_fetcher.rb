desc "Import vnexpress events"
task vnexpress_fetcher: :environment do 
  RssCrawler.new('https://vnexpress.net/rss/thoi-su.rss').run
end

desc "Import vnexpress/xe events"
task vnexpreess_xe_fetcher: :environment do 
  RssCrawler.new('https://vnexpress.net/rss/oto-xe-may.rss').run
end

desc "Import vnexpress/cuoi events"
task vnexpreess_cuoi_fetcher: :environment do 
  RssCrawler.new('https://vnexpress.net/rss/cuoi.rss').run

desc "Import tienphong events"
task tienphong: :environment do 
  RssCrawler.new('https://www.tienphong.vn/rss/xa-hoi-phong-su-13.rss').run

desc "Import nytimes events"
task nytimes: :environment do 
  RssCrawler.new('http://rss.nytimes.com/services/xml/rss/nyt/Baseball.xml').run

end
