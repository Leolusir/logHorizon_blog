class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  has_and_belongs_to_many :tags
end
