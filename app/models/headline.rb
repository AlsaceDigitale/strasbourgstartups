class Headline
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Slug

  field :title, type: String, localize: true
  field :body, type: String, localize: true
  field :published_at, type: Time, default: Time.now
  field :is_focus, type: Boolean, default: false

  # slug :title, history: true, localize: true
  slug :title, localize: true

  has_mongoid_attached_file :banner,
    styles: {
      small: ['100x100>', :png],
      medium: ['500x500>', :png]
    }
  validates_attachment_content_type :banner, content_type: /\Aimage/

  scope :publicly_visible, -> { desc(:published_at).where(published_at: {"$lt" => Time.now}) }

  def chapo
    (ActionView::Base.full_sanitizer.sanitize(body).split(/\.|\!|\?/).first.strip + ".").truncate(120)
  end
end
