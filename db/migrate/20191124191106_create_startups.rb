class CreateStartups < ActiveRecord::Migration[6.0]
  def change
    create_table :startups do |t|
      t.string :slug, uniq: true
      t.string :name
      t.string :url
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :email
      t.boolean :is_published, default: false
      t.date :added_on

      t.timestamps
    end
  end
end
