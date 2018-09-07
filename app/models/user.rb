class User < ApplicationRecord
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :readings
  has_many :hides
  has_many :likes
  has_many :bookmarks
  attr_accessor :delete_photo
  has_attached_file :photo,
    :styles   => {
      :medium => "200x200",
      :thumb  => "50x50#",
      :small  => "150x150>"},
    :preserve_files => true
  validates_attachment_content_type :photo, 
           :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
