class Rsslink < ApplicationRecord
  validates_uniqueness_of :source

  def self.rss_importer
    link = Rsslink.all
    link.map{|link| link.url}.each do |url|
    RssCrawler.new("#{url}").run
    end
  end
end
