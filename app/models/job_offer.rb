class JobOffer < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]

  belongs_to :startup

  has_rich_text :body

  validates :title, :body, :end_publishing_on, presence: true
end
