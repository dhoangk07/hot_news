class Rsslink < ApplicationRecord
  validates_uniqueness_of :url

  def self.rss_importer
    self.all.each do |rsslink|
      RssCrawler.new(rsslink.url).run
    end
  end
end

