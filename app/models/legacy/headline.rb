class Legacy::Headline
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Taggable

  store_in collection: 'headlines'

  field :title, type: String, localize: true
  field :body, type: String, localize: true
  field :published_at, type: Time, default: -> { Time.now }
  field :is_focus, type: Boolean, default: false

  validates :title, :body, presence: true

  # slug :title, history: true, localize: true
  slug :title, localize: true

  has_mongoid_attached_file :banner,
    styles: {
      small: ['100x100>', :png],
      medium: ['500x250#', :png]
    }
  validates_attachment_content_type :banner, content_type: /\Aimage/

  scope :publicly_visible, -> { desc(:published_at).where(published_at: {"$lt" => Time.now}) }

  def chapo
    first_part = ActionView::Base.full_sanitizer.sanitize(body).split(/\.|\!|\?/).first
    first_part.present? ? (first_part.strip + ".").truncate(120) : nil
  end
end
