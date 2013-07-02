class Startup
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, type: String
  field :url, type: String
  field :adress, type: String
  field :email, type: String
  field :description, type: String
  field :is_published, type: Boolean, default: false

  field :coordinates, type: Array

  has_mongoid_attached_file :logo
end
