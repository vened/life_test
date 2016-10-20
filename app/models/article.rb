class Article < ApplicationRecord

  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :description, presence: true
  validates :link, presence: true
end
