class Category < ApplicationRecord
  has_many :items

  scope :sorted, -> { order(:name) }

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
