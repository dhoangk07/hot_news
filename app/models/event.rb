class Event < ApplicationRecord
	has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  has_many :readings
  has_many :hides
  has_many :likes
  has_many :bookmarks
  paginates_per 5
  validates_uniqueness_of :source

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
end
