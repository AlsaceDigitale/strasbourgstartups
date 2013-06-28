class Startup
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :adress, type: String
  field :email, type: String
  field :description, type: String
  field :is_published, type: Boolean, deafult: false
end
