namespace :rss_importer do
  desc "Import huge rss events"
  task huge_events: :environment do
    Rsslink.rss_importer
  end
end
