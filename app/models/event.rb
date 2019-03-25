class Event < ApplicationRecord
	has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :readings, dependent: :destroy
  has_many :hides, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  paginates_per 25
  validates_uniqueness_of :source

  def count_comment    
    Comment.where(event_id: self.id).count
  end
  
  def self.search(search)
    if search
      self.where('title ILIKE ?', "%#{search}%")
    else
      self
    end
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).events
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.delete_old_events_less_than_100_days_ago
    self.where("created_at < ?", 100.days.ago).destroy_all
  end
end
