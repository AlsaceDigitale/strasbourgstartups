class CreateHeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :headlines do |t|
      t.string :title
      t.string :slug, index: true
      t.datetime :published_at
      t.boolean :is_focus

      t.timestamps
    end
  end
end
