class Article < ApplicationRecord
  include PgSearch

  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :description, presence: true
  validates :link, presence: true

  pg_search_scope :search_by_full_text, :against => [:title, :description]
end
