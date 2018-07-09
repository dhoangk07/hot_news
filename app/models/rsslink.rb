class Rsslink < ApplicationRecord
  validates_uniqueness_of :source

  def self.rss_importer
    Rsslink.all.each do |rsslink|
      RssCrawler.new(rsslink.url).run
    end
  end
end

