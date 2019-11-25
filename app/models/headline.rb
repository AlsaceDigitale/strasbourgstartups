class Headline < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]

  has_rich_text :body

  has_one_attached :banner
  # validates_attachment_content_type :banner, content_type: /\Aimage/

  scope :publicly_visible, -> { order(published_at: :desc).where("published_at < ?", Time.now) }

  validates :title, :body, presence: true

  def chapo
    first_part = ActionView::Base.full_sanitizer.sanitize(body.to_s).split(/\.|\!|\?/).first
    first_part.present? ? (first_part.strip + ".").truncate(120) : nil
  end
end
