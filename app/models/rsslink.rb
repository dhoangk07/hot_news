class Rsslink < ApplicationRecord
  validates_uniqueness_of :source

  def self.rss_importer
    Rsslink.each do |rsslink|
      RssCrawler.new(rsslink.url).run
    end
  end
end
