class User < ApplicationRecord
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :readings
  has_many :hides
  has_many :likes
  has_many :bookmarks
end
