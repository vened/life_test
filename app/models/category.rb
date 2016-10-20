class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :title, presence: true

end