class Startup < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders history]

  has_many :startup_users
  has_many :users, through: :startup_users
  has_many :job_offers

  has_rich_text :description

  has_one_attached :logo
  # validates_attachment_content_type :logo, content_type: /\Aimage/

  scope :publicly_visible, -> { order(added_on: :desc).where(is_published: true) }

  validates :name, presence: true, uniqueness: true

  def address
    [street, zip_code, city].compact.join(', ')
  end

  def url
    x = read_attribute :url
    if x.present?
      uri = URI(x)
      uri = URI("http://#{x}") if uri.scheme.blank?
      uri.to_s
    else
      x
    end
  end
end
