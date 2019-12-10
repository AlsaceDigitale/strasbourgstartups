class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String, localize: true
  field :body, type: String, localize: true
  field :happen_at, type: Time
end
