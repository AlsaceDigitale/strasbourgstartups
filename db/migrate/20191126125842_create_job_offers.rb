class CreateJobOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.string :slug, index: true
      t.boolean :is_published, default: true
      t.date :end_publishing_on, default: 3.months.from_now.to_date
      t.references :startup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
