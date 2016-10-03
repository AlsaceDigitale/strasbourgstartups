class JobOffer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :is_published, type: Boolean, default: false
  field :end_publishing_on, type: Date, default: 3.months.from_now

  belongs_to :startup

  scope :publicly_visible, -> { desc(:updated_at).where(is_published: true, end_publishing_on: {"$gt" => Time.now}) }

  validates :title, :body, :end_publishing_on, presence: true
end
