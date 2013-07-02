class Startup
  include Mongoid::Document
  include Mongoid::Paperclip
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

  has_mongoid_attached_file :logo

  geocoded_by :address

  def address
    [street, zip_code, city].compact.join(', ')
  end
end
