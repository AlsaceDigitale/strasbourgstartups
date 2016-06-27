class Startup
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :url, type: String
  field :street, type: String
  field :zip_code, type: String
  field :city, type: String
  field :email, type: String
  field :description, type: String, localize: true
  field :is_published, type: Boolean, default: false
  field :added_on, type: Date, default: Date.today

  field :coordinates, type: Array

  has_and_belongs_to_many :users

  slug :name

  has_mongoid_attached_file :logo,
    styles: {
      small: ['250x250>', :png],
      medium: ['500x500>', :png]
    },
    default_url: lambda { |image| ActionController::Base.helpers.asset_path('question-mark.svg') }
  validates_attachment_content_type :logo, content_type: /\Aimage/

  scope :publicly_visible, -> { desc(:added_on).where(is_published: true) }

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode

  def address
    [street, zip_code, city].compact.join(', ')
  end

  # def description
  #   locale = I18n.locale
  #   txt = self["description_#{locale}".to_sym]
  #   contrary = locale.to_s == "en" ? "fr" : "en"
  #   txt = txt.present? ? txt : self["description_#{contrary}".to_sym]
  #   txt.present? ? txt : self["description".to_sym]
  # end

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

  def logo_url(size = nil)
    if logo.file?
      logo_file_name.ends_with?("svg") ? logo.url : logo.url(size)
    else
      logo.url
    end
  end
end
