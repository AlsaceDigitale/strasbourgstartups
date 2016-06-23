class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :code
  field :title, type: String, localize: true
  field :body, type: String, localize: true

  slug :title, localize: true

  validates :title, :code, presence: true

  index({ code: 1 }, { unique: true, background: true })
end
