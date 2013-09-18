class Headline
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title_fr, type: String
  field :title_en, type: String
  field :body_fr, type: String
  field :body_en, type: String
  field :published_at, type: Time

  slug :title_en

  def title_en
    txt = read_attribute(:title_en)
    txt.present? ? txt : read_attribute(:title)
  end

  def body_en
    txt = read_attribute(:body_en)
    txt.present? ? txt : read_attribute(:body)
  end

  def title
    "#{title_en} / #{title_fr}"
  end

  def body
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render "#{body_en}\n\n#{body_fr}"
  end
end
