class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]

  has_rich_text :body

  validates :title, :code, presence: true
end
