class Startup
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :url, type: String
  field :street, type: String
  field :zip_code, type: String
  field :city, type: String
  field :email, type: String
  field :description, type: String
  field :is_published, type: Boolean, default: false

  field :coordinates, type: Array

  slug :name

  has_mongoid_attached_file :logo

  geocoded_by :address

  before_validation do |startup|
    if startup.is_published == "1"
      startup.is_published = true
    elsif startup.is_published == "0"
      startup.is_published = false
    end
  end

  def address
    [street, zip_code, city].compact.join(', ')
  end

  def self.is_published
    where(:is_published => true)
  end
end
