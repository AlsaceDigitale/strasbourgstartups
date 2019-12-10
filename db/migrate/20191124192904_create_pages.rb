class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :code, index: true, uniq: true
      t.string :title
      t.string :slug, index: true

      t.timestamps
    end
  end
end
