class RunImporter
  @queue = :default

  def self.perform
    Rsslink.rss_importer
  end
end